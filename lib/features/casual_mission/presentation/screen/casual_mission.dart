import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qr_code/features/casual_mission/data/model/casual_mission_request.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../../data/model/mission.dart';
import '../../data/model/open_mission.dart';
import '../../data/model/vehicle_list_reponse.dart' show CasualMissionType;
import '../../data/repo/get_vehicle_list_repo.dart';
import '../../data/repo/vehicle_plates_repo.dart';
import '../cubit/casual_mission/casual_mission_cubit.dart';
import '../widget/mission_card.dart';
import '../widget/missions_bottom_bar.dart';

class MissionsScreen extends StatefulWidget {
  const MissionsScreen({super.key,required this.code});
  final String code;
  @override
  State<MissionsScreen> createState() => _MissionsScreenState();
}

class _MissionsScreenState extends State<MissionsScreen> {
  var missions = [Mission()];
  var _details = TextEditingController();
  CasualMissionItem? _item;

  /// المأمورية المفتوحة (اتسجلت بدايتها ولسه ماخلصتش) - محفوظة على الموبايل.
  late OpenMission? _open = OpenMission.load(widget.code);

  VehicleLists _lists = (tipper: <VehicleOption>[], flatbed: <VehicleOption>[]);

  /// عربيات قطاع المأمورية المفتوحة (القطاع 1 tipper، غيره flatbed، زي الـ FMS).
  List<VehicleOption> get _plates =>
      VehiclePlatesRepo.forSector(_lists, _open?.sectorId);

  @override
  void initState() {
    super.initState();
    _loadPlates();
  }

  List<CasualMissionType> _types = []; // أنواع المهام (لعرضها وتعديلها)

  Future<void> _loadPlates() async {
    final list = await VehiclePlatesRepo.getLists();
    if (mounted) setState(() => _lists = list);
    final res = await GetVehicleListRepo.getVehicleList();
    final types = res?.data.firstOrNull?.casualMissionType ?? [];
    if (mounted) setState(() => _types = types);
  }

  CasualMissionType? _typeOf(int? id) =>
      _types.where((t) => t.id == id).firstOrNull;

  String? _plateOf(int? vehicleId) =>
      _plates.where((v) => v.id == vehicleId).firstOrNull?.plate;

  /// مسح المأمورية المفتوحة من الموبايل.
  /// ملاحظة: مفيش endpoint لمسحها من السيرفر، فبتتمسح هنا بس.
  Future<void> _discard() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('مسح المأمورية'),
        content: const Text('متأكدة إنك عايزة تمسحي المأمورية المفتوحة؟'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('إلغاء')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('مسح', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (ok == true) await _onEnded();
  }

  /// تعديل العربية والتفاصيل للمأمورية المفتوحة (بتتبعت مع الإنهاء).
  Future<void> _edit(OpenMission open) async {
    int? vehicleId = open.vehicleId;
    int? typeId = open.typeId;
    num wage = open.wage;
    DateTime start = open.start;
    final notes = TextEditingController(text: open.notes);
    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) => Padding(
          padding: EdgeInsets.fromLTRB(
              16, 16, 16, MediaQuery.of(ctx).viewInsets.bottom + 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text('تعديل المأمورية',
                  style: AppStyles.bold.copyWith(
                      fontSize: 16, color: const Color(0xFF2563EB))),
              DropdownButtonFormField<int>(
                initialValue: _plates.any((v) => v.id == vehicleId) ? vehicleId : null,
                isExpanded: true,
                decoration: const InputDecoration(
                  labelText: 'رقم العربية',
                  prefixIcon: Icon(Icons.directions_car),
                  border: OutlineInputBorder(),
                ),
                items: _plates
                    .map((v) => DropdownMenuItem(value: v.id, child: Text(v.plate)))
                    .toList(),
                onChanged: (v) => setSheet(() => vehicleId = v),
              ),
              DropdownButtonFormField<int>(
                initialValue: _types.any((t) => t.id == typeId) ? typeId : null,
                isExpanded: true,
                decoration: const InputDecoration(
                  labelText: 'نوع المهمة',
                  prefixIcon: Icon(Icons.build_outlined),
                  border: OutlineInputBorder(),
                ),
                items: _types
                    .map((t) => DropdownMenuItem(
                        value: t.id, child: Text(t.casualMissionTypeNameAr)))
                    .toList(),
                onChanged: (v) => setSheet(() {
                  typeId = v;
                  // القيمة بتتغيّر حسب النوع الجديد
                  wage = _typeOf(v)?.defaultValue ?? wage;
                }),
              ),
              InkWell(
                onTap: () async {
                  final today = DateTime.now();
                  final d = await showDatePicker(
                    context: ctx,
                    initialDate: start.isAfter(today) ? today : start,
                    firstDate: DateTime(2020),
                    lastDate: today, // البداية ماتبقاش بعد النهاردة
                  );
                  if (d != null) setSheet(() => start = d);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'تاريخ بداية المأمورية',
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    border: OutlineInputBorder(),
                  ),
                  child: Text(DateFormat('d/M/yyyy').format(start)),
                ),
              ),
              TextField(
                controller: notes,
                decoration: const InputDecoration(
                  labelText: 'التفاصيل',
                  prefixIcon: Icon(Icons.notes_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: const Text('حفظ التعديل'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    final newNotes = notes.text;
    notes.dispose();
    if (saved != true) return;
    final updated = open.copyWith(
      vehicleId: vehicleId,
      notes: newNotes,
      typeId: typeId,
      wage: wage,
      start: start,
    );
    await updated.save(widget.code);
    if (mounted) setState(() => _open = updated);
  }

  Future<void> _onSaved(int? missionId) async {
    final item = _item;
    if (item == null) return;
    final open = OpenMission(
      missionId: missionId,
      driverId: item.driverId,
      sectorId: item.businessSectorId,
      vehicleId: item.vehicleId,
      typeId: item.casualMissionTypeId,
      notes: item.notes,
      wage: item.value,
      start: item.casualMissionDate,
    );
    await open.save(widget.code);
    if (mounted) setState(() => _open = open);
  }

  /// إنهاء المأمورية: النهاية = النهاردة، بنحسب عدد الأيام والقيمة من البداية
  /// لحد النهاردة ونعرضهم، من غير ما نبعت حاجة للسيرفر أو نستنى رده.
  Future<void> _finish(OpenMission open) async {
    final end = DateTime.now();
    final days = open.daysUntil(end);
    final value = open.valueUntil(end);
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('تم إنهاء المأمورية'),
        content: Text('عدد الأيام: $days\nالقيمة: ${value.toStringAsFixed(2)}'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('تمام')),
        ],
      ),
    );
    await _onEnded();
  }

  Future<void> _onEnded() async {
    await OpenMission.clear(widget.code);
    if (!mounted) return;
    setState(() {
      _open = null;
      _item = null;
      missions = [Mission()];
      _details = TextEditingController();
    });
  }

  Widget _openMissionPanel(OpenMission open) {
    final today = DateTime.now();
    final fmt = DateFormat('d/M/yyyy');
    Widget row(IconData icon, String label, String value) => Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF2563EB)),
            const SizedBox(width: 8),
            Text(label),
            const Spacer(),
            Text(value, style: AppStyles.bold.copyWith(
                fontSize: 14, color: Theme.of(context).textTheme.bodyLarge?.color)),
          ],
        );
    return Card(
      elevation: 2,
      color: Theme.of(context).focusColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(Icons.local_shipping_outlined, color: Color(0xFF2563EB)),
              const SizedBox(width: 8),
              Text('مأمورية مفتوحة',
                  style: AppStyles.bold.copyWith(
                      fontSize: 16, color: const Color(0xFF2563EB))),
              const Spacer(),
              IconButton(
                tooltip: 'تعديل',
                icon: const Icon(Icons.edit_outlined, color: Color(0xFF2563EB)),
                onPressed: () => _edit(open),
              ),
              IconButton(
                tooltip: 'مسح',
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: _discard,
              ),
            ]),
            row(Icons.directions_car, 'رقم العربية', _plateOf(open.vehicleId) ?? '-'),
            row(Icons.build_outlined, 'نوع المهمة',
                _typeOf(open.typeId)?.casualMissionTypeNameAr ?? '-'),
            if (open.notes.trim().isNotEmpty)
              row(Icons.notes_outlined, 'التفاصيل', open.notes),
            row(Icons.play_arrow_rounded, 'تاريخ البداية', fmt.format(open.start)),
            row(Icons.today_outlined, 'عدد الأيام لحد دلوقتي',
                '${open.daysUntil(today)}'),
            row(Icons.attach_money, 'القيمة لحد دلوقتي',
                open.valueUntil(today).toStringAsFixed(2)),
            const Text('تاريخ النهاية هيتسجل بيوم ما تدوسي "إنهاء المأمورية".'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final open = _open;
    return
      BlocProvider(
          create: (context){
            return CasualMissionCubit();
          },child:
      Scaffold(
        appBar: AppBar(
          title: const Text('المأموريات'),
        ),
        // الشاشة كلها بتعمل scroll: البانر والكروت مع بعض
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // بانر مختصر (سطر واحد)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF38BDF8), Color(0xFF2563EB)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.edit_calendar_rounded, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(open == null ? 'سجّل مأموريتك' : 'مأموريتك شغالة',
                      style: AppStyles.bold.copyWith(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            if (open != null)
              _openMissionPanel(open)
            else
              for (var i = 0; i < missions.length; i++)
                MissionCard(
                  date: DateTime.now(),
                  selectedVehicle: null,
                  code: widget.code,
                  key: ObjectKey(missions[i]),
                  number: i + 1,
                  onChanged: () => setState(() {}),
                  onItemChanged: (item) => setState(() => _item = item),
                  onDelete: () => setState(() => missions.removeAt(i)), selectedMissionType: '', details: _details,
                ),
          ],
        ),

        bottomNavigationBar: open != null
            ? MissionsBottomBar(
                isEnd: true,
                request: open.endRequest(DateTime.now()),
                // بعد ما الـ FMS يستلم المأمورية: نعرض الأيام والقيمة ونقفلها
                onEndPressed: () => _finish(open),
              )
            : MissionsBottomBar(
                onSaved: _onSaved,
                request: CasualMissionRequest(
                  fromDate: _item?.casualMissionDate ?? DateTime.now(),
                  toDate: _item?.casualMissionDate ?? DateTime.now(),
                  businessSectorId: _item?.businessSectorId ?? 1,
                  casualMissionJson: _item == null ? [] : [_item!],
                ),
              ),
      ) );
  }
}
