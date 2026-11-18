import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/core/widget/custom_form_field.dart';
import 'package:qr_code/features/casual_mission/presentation/cubit/value_cubit/value_state.dart';
import 'package:qr_code/features/home/data/repo/driver_vehicle_repo.dart';
import 'package:qr_code/features/casual_mission/data/repo/vehicle_plates_repo.dart';
import 'package:qr_code/features/licence/presentation/widget/shimmer_license.dart';
import 'package:qr_code/features/login/presentation/widget/user_name_widget.dart';
import 'package:qr_code/features/login/data/repo/driver_name_repo.dart';
import '../../../../core/widget/snack_bar.dart';
import '../../../licence/data/repo/driver_details_repo.dart';
import '../../data/model/casual_mission_request.dart';
import '../../data/model/mission.dart';
import '../cubit/casual_type/casual_type_Cubit.dart';
import '../cubit/casual_type/casual_type_state.dart';
import '../cubit/value_cubit/value_cubit.dart';
import 'mission_date_field.dart';
import 'mission_dropdown.dart';

class MissionCard extends StatefulWidget {
  MissionCard({
    super.key,
    required this.number,
    required this.onChanged,
    required this.onDelete,
    required this.code,
    required this.selectedVehicle,
    required this.selectedMissionType,
    required this.details,
    this.numOfDays,
    this.value,
    required this.date,
    this.onItemChanged,
  });

  final int number;
  final VoidCallback onChanged;
  final VoidCallback onDelete;
  final ValueChanged<CasualMissionItem>? onItemChanged;
  final String code;
  DateTime date;
  String? selectedVehicle;
  String? selectedMissionType;
  TextEditingController details;
  TextEditingController? numOfDays;
  TextEditingController? value;

  @override
  State<MissionCard> createState() => _MissionCardState();
}

class _MissionCardState extends State<MissionCard> {
  // القيمة المعروضة = wage × عدد الأيام (الـ wage الأصلي بيفضل في widget.value)
  final _totalCtrl = TextEditingController();

  // بداية المأمورية = النهاردة (أوتوماتيك)، والنهاية بتتحدد لما السواق ينهيها.
  late final DateTime _date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  late final DateTime _endDate = _date;

  /// عدد أيام المأمورية (شامل يوم البداية ويوم النهاية).
  int get _daysCount {
    final from = DateTime(_date.year, _date.month, _date.day);
    final to = DateTime(_endDate.year, _endDate.month, _endDate.day);
    return to.difference(from).inDays + 1;
  }

  int? _driverId, _vehicleId, _typeId,sectorId;
  double _wage = 0;
  String? _driverName;
  LinkedVehicle? _linked; // العربية المربوطة بالسواق
  bool _linkedLoaded = false;
  VehicleLists _lists = (tipper: <VehicleOption>[], flatbed: <VehicleOption>[]);
  bool _driverLoaded = false; // القطاع بيتحدد بعد تحميل بيانات السواق
  /// عربيات قطاع السواق (نفس قايمة الـ FMS: القطاع 1 tipper، غيره flatbed).
  List<VehicleOption> get _vehicles =>
      VehiclePlatesRepo.forSector(_lists, sectorId);
  bool _vehiclesLoading = true;
  // العربية المختارة محفوظة هنا (مش في widget) لأن الشاشة الأم بتبني الكارت من جديد
  // بـ selectedVehicle: null كل ما الـ item يتغيّر.
  String? _selectedPlate;
  String? _linkedPlate; // رقم عربية السواق (لو لاقيناها في القايمة)
  void _notify() {
    final days = _daysCount;
    widget.onItemChanged?.call(CasualMissionItem(
      id: 0,
      driverId: _driverId,
      businessSectorId: sectorId,
      vehicleId: _vehicleId,
      casualMissionTypeId: _typeId,
      notes: widget.details.text,
      days: days,
      value: _wage,
      totalValue: days * _wage,
      casualMissionDate: _date,
    ));
  }

  @override
  void dispose() {
    _totalCtrl.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _loadVehicles();
    _loadLinked();
    _loadDriverId();
  }

  Future<void> _loadVehicles() async {
    final list = await VehiclePlatesRepo.getLists();
    if (!mounted) return;
    setState(() {
      _lists = list;
      _vehiclesLoading = false;
    });
    _prefillLinkedVehicle();
  }
  Future<void> _loadDriverId() async {
    try {
      final code = widget.code.trim();

      final details = await DriverDetailsRepo.getDriverDetails();
      debugPrint('CODE = "$code"');
      debugPrint('USERNAMES = ${details?.data.map((d) => d.userName).take(10).toList()}');
      debugPrint('DRIVER ID = $_driverId');
      final matches = details?.data
          .where((d) => d.userName?.trim() == code)
          .toList() ??
          [];
      debugPrint('MATCHES = ${matches.length}: '
          '${matches.map((d) => "${d.driverId}/${d.fleetStaffId}/${d.businessSectorId}").toList()}');
      final driver = matches.firstOrNull;
      _driverId = driver?.driverId;

      sectorId = driver?.businessSectorId;
      final names = await DriverNameRepo.getName();
      final staff = names?.data
          .where((d) => d.userName?.trim() == code)
          .firstOrNull;
      _driverName = staff?.fleetStaffName;
    } catch (e) {
      debugPrint('LOAD DRIVER ERROR: $e');
    }
    if (!mounted) return; // الشاشة اتقفلت أثناء انتظار الـ API
    setState(() => _driverLoaded = true); // دلوقتي نعرف القطاع وقايمة العربيات
    _prefillLinkedVehicle();
    _notify();
  }

  /// رقم العربية المربوطة بالسواق (من SearchByEmployeeNo) - مستقل عن باقي التحميلات.
  Future<void> _loadLinked() async {
    _linked = await DriverVehicleRepo.getLinkedVehicle(widget.code.trim());
    if (!mounted) return;
    setState(() => _linkedLoaded = true);
    _prefillLinkedVehicle();
  }

  /// أول ما الصفحة تتفتح بنعرض رقم عربية السواق في الحقل (بدل "اختار العربية")،
  /// وبعدها يقدر يغيّرها لأي رقم عربية تاني من القايمة.
  /// بتتنده بعد تحميل العربيات وبعد تحميل عربية السواق، وبتشتغل لما الاتنين يخلصوا.
  void _prefillLinkedVehicle() {
    if (!_linkedLoaded || !_driverLoaded || _vehiclesLoading || _vehicleId != null) return;
    final linked = _linked;
    if (linked == null) return;
    debugPrint('PREFILL linked=${linked.id}/${linked.plate} vehiclesInList=${_vehicles.length}');
    // لازم تكون من قايمة قطاع السواق، وإلا الـ FMS مايعرفش يعرض اسمها
    // المطابقة: بالـ id، وبعدين برقم اللوحة (من غير مسافات وبغض النظر عن ترتيب
    // الحروف والأرقام، لأن اللوحة ممكن تتكتب "5382 ل س" أو "ل س 5382").
    String key(String s) =>
        (s.replaceAll(RegExp(r'\s+'), '').split('')..sort()).join();
    final linkedKey = linked.plate == null ? null : key(linked.plate!);
    final match = _vehicles.where((v) => v.id == linked.id).firstOrNull ??
        _vehicles
            .where((v) =>
                linkedKey != null &&
                (key(v.plate) == linkedKey || v.plate.contains(linked.plate!)))
            .firstOrNull;
    debugPrint('PREFILL sector=$sectorId listSize=${_vehicles.length} '
        'linkedId=${linked.id} linkedPlate=${linked.plate} '
        'matched=${match == null ? null : "${match.id}:${match.plate}"} '
        'sample=${_vehicles.take(5).map((v) => "${v.id}:${v.plate}").toList()}');
    if (match == null) return;
    setState(() {
      _linkedPlate = match.plate;
      _selectedPlate = match.plate;
    });
    _vehicleId = match.id;
    _notify();
  }

  Widget field(
      BuildContext context,
      String hint,
      IconData icon,
      TextEditingController controller, {
        bool number = false,
      }) {
    return CustomFormField(
      hintText: hint,
      preIcon: Icon(icon),
      controller: controller,
      keyboardType: number ? TextInputType.number : null,
      onChanged: (_) {
        if (number) widget.onChanged();
        _notify();
      },
      borderSide: BorderSide(color: AppColors.borderColor),
      fillColor: Theme.of(context).scaffoldBackgroundColor,
      style: Theme.of(context).textTheme.bodyMedium,
      hintStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: const Color(0xFF2563EB).withValues(alpha: 0.2),
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).focusColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Column(
        children: [
          // عنوان هادي (بدون تدرّج) أعلى الكارت
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: const Color(0xFF2563EB).withValues(alpha: 0.1),
            child: Row(
              children: [
                const Icon(Icons.assignment_outlined, color: Color(0xFF2563EB), size: 20),
                const SizedBox(width: 8),
                Text('مأمورية رقم ${widget.number}', style: AppStyles.bold.copyWith(fontSize: 14, color: const Color(0xFF2563EB))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 12,
              children: [
                UserNameWidget(code: widget.code),
                // شيمر بدل "اختار رقم العربية" لحد ما عربية السواق المربوطة تظهر
                // (أو نعرف إنه مش مربوط بعربية)
                if (_vehiclesLoading || !_linkedLoaded || !_driverLoaded)
                  ShimmerLicense(width: double.infinity, height: 50)
                else if (_vehicles.isNotEmpty)
                  Builder(builder: (context) {
                    final plates = _vehicles.map((v) => v.plate).toList();
                    final selected = plates.contains(_selectedPlate)
                        ? _selectedPlate
                        : null;
                    final isLinked = selected != null && selected == _linkedPlate;
                    return MissionDropdown(
                      // الـ key بيخلي الحقل يتبنّى من جديد لما القيمة تتغيّر
                      // (اختيار تلقائي لعربية السواق)
                      key: ValueKey(selected),
                      hint: 'اختار رقم العربية',
                      icon: Icons.directions_car,
                      value: selected,
                      editIcon: isLinked,
                      helperText: isLinked
                          ? 'العربية المربوطة بالسواق - اضغط لتغييرها بأي رقم عربية تاني'
                          : null,
                      items: plates,
                      onChanged: (value) {
                        setState(() => _selectedPlate = value);
                        _vehicleId = _vehicles
                            .where((v) => v.plate == value)
                            .map((v) => v.id)
                            .firstOrNull;
                        _notify();
                      },
                    );
                  }),
                BlocProvider(
                  create: (context) =>
                  CasualMissionTypeCubit()..fetchCasualMissionTypes(),
                  child:
                  BlocConsumer<
                      CasualMissionTypeCubit,
                      CasualMissionTypeState
                  >(
                    listener: (context, state) {
                      if (state is CasualMissionTypeError) {
                        showToast(context, state.msg, StateType.error);
                      }
                    },
                    builder: (context, state) {
                      if (state is CasualMissionTypeLoading) {
                        return ShimmerLicense(
                          width: double.infinity,
                          height: 50,
                        );
                      }
                      if (state is CasualMissionTypeSuccess) {
                        return MissionDropdown(
                          hint: 'نوع المهمة',
                          icon: Icons.build_outlined,
                          value:
                          state
                              .casualMissionTypes
                              .first
                              .casualMissionTypeNameAr ==
                              widget.selectedMissionType
                              ? widget.selectedMissionType
                              : null,
                          items: state.casualMissionTypes
                              .map((v) => v.casualMissionTypeNameAr)
                              .toList(),
                          onChanged: (v) {
                            final type = state.casualMissionTypes
                                .where((t) => t.casualMissionTypeNameAr == v)
                                .firstOrNull;
                            setState(() {
                              widget.selectedMissionType = v;
                              _typeId = type?.id;
                              _wage = type?.defaultValue ?? 0;   // القيمة حسب النوع
                            });
                            widget.value?.text = _wage.toString();
                            _notify();
                            widget.onChanged();
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                field(
                  context,
                  'التفاصيل',
                  Icons.notes_outlined,
                  widget.details,
                ),
                // البداية بتتسجل أوتوماتيك بيوم ما المأمورية بدأت، والنهاية بتتسجل
                // بيوم ما السواق يدوس "إنهاء المأمورية".
                IgnorePointer(
                  child: MissionDateField(
                    label: 'تاريخ بداية المأمورية (النهاردة)',
                    date: _date,
                    onChanged: (_) {},
                  ),
                ),
                BlocProvider(
                  create: (context) => ValueCubit()..fetchVehicleList(),
                  child: BlocConsumer<ValueCubit, ValueState>(
                    listener: (context, state) {
                      if (state is ValueError) {
                        showToast(context, state.msg, StateType.error);
                      }
                    },
                    builder: (context, state) {
                      if (state is ValueLoading) {
                        return ShimmerLicense(width: double.infinity, height: 50);
                      }
                      if (state is ValueSuccess) {
                        // القيمة = قيمة النوع × عدد أيام المأمورية (من البداية للنهاية)
                        _totalCtrl.text = (_daysCount * _wage).toStringAsFixed(2);
                        return IgnorePointer(
                          child: CustomFormField(
                            borderSide: BorderSide(color: AppColors.borderColor),
                            hintText: "القيمة",
                            hintStyle: Theme.of(context).textTheme.bodyMedium,
                            preIcon: Icon(Icons.attach_money),
                            controller: _totalCtrl,
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
