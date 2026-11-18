import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/vehicles/presentation/widget/case2/rfr_details.dart';
import 'package:qr_code/features/vehicle_with_rfr_details/data/model/vehicle_details_response.dart';
import '../../../../../core/app_colors/app_colors.dart';
import '../../../../../core/widget/custom_form_field.dart';
import '../../../../../core/widget/snack_bar.dart';
import '../../cubit/rfr_details_cubit/rfr_details_cubit.dart';
import '../../cubit/rfr_details_cubit/rfr_details_state.dart';
import '../create_rfr.dart';

class Case2 extends StatefulWidget {
  const Case2({super.key, required this.vehicle});
  final Datum vehicle;
  @override
  State<Case2> createState() => _Case2State();
}

class _Case2State extends State<Case2> {
  bool isFormValid = false;
  String? description;
  int? selectedRfrListId;
  int? selectedVehicleStatusId;
  String? locationAddress;

  bool _checkFormValid(RfrDetailsCubit cubit) {
    final formOk = cubit.formKey.currentState?.validate() ?? false;
    return formOk &&
        selectedRfrListId != null &&
        selectedVehicleStatusId != null &&
        (description?.trim().isNotEmpty ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RfrDetailsCubit()..getBusinessSector(),
      child: BlocConsumer<RfrDetailsCubit, RfrDetailsState>(
        listener: (context, state) {
          if (state is RfrDetailsFailState) {
            showToast(context, "حدث خطأ");
          }
        },
        builder: (context, state) {
          final cubit = context.read<RfrDetailsCubit>();
          if (state is RfrDetailsSuccessState) {
            return Form(
              key: cubit.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: () {
                setState(() {
                  isFormValid = _checkFormValid(cubit);
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RfrDetails(
                    onChanged: (value) {
                      setState(() {
                        selectedRfrListId = value;
                        isFormValid = _checkFormValid(cubit);
                      });
                    },
                    type: "نوع العطل",
                    items: state.response.first.rfrList,
                  ),
                  const SizedBox(height: 24),

                  RfrDetails(
                    onChanged: (value) {
                      setState(() {
                        selectedVehicleStatusId = value;
                        isFormValid = _checkFormValid(cubit);
                      });
                    },
                    type: "حالة مركبة البلاغ",
                    items: state.response.first.rfrVehicleStatus,
                  ),
                  const SizedBox(height: 24),

                  CustomFormField(
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                    ),
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
                    hintText: "تفاصيل عن البلاغ",
                    fillColor: Theme.of(context).focusColor,
                    onChanged: (value) {
                      description = value;
                      setState(() {
                        isFormValid = _checkFormValid(cubit);
                      });
                    },
                  ),

                  const SizedBox(height: 24),

                  // CurrentLocationField(
                  //   onChanged: (value) {
                  //     final isValid =
                  //         cubit.formKey.currentState?.validate() ?? false;
                  //     setState(() {
                  //       locationAddress = value;
                  //       isFormValid = isValid;
                  //     });
                  //   },
                  // ),

                  const SizedBox(height: 24),

                  if (isFormValid)
                    CreateRfr(
                      vehicle: widget.vehicle,
                      selectedRfrListId: selectedRfrListId!,
                      selectedVehicleStatusId: selectedVehicleStatusId!,
                      description: description ?? '',
                      locationControlRoom: locationAddress ?? '',
                    ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}