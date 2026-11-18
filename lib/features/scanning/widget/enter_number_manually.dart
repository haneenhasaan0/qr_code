import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/features/vehicle_with_rfr_details/data/model/vehicle_details_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/core/widget/snack_bar.dart';
import 'package:qr_code/features/vehicle_with_rfr_details/presentation/cubit/vehicle_details_cubit/vehicle_details_cubit.dart';
import '../../../core/widget/custom_form_field.dart';
import '../../vehicle_with_rfr_details/presentation/cubit/vehicle_details_cubit/vehicle_details_state.dart';

class EnterNumberManually extends StatefulWidget {
  const EnterNumberManually({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<EnterNumberManually> createState() => _EnterNumberManuallyState();
}

class _EnterNumberManuallyState extends State<EnterNumberManually> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VehicleDetailsCubit()..loadVehicles(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<VehicleDetailsCubit>();

          return BlocConsumer<VehicleDetailsCubit, VehicleDetailState>(
            listener: (context, state) {
              if (state is VehicleDetailFailState) {
                showToast(context, state.errorMsg, StateType.error);
              }

              if (state is VehicleRfrSuccessState) {
                context.push(
                  '/rfr_details',
                  extra: widget.controller.text.trim(),
                );
              }
              if (state is VehicleDetailSuccessState) {
                context.push('/vehicle_screen', extra: state.data.first);
              }
            },
            builder: (context, state) {
              final isLoading = state is VehicleDetailLoadingState;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: cubit.formKey,
                    child: RawAutocomplete<Datum>(
                      textEditingController: widget.controller,
                      focusNode: _focusNode,
                      displayStringForOption: (vehicle) => vehicle.licensePlate,
                      optionsBuilder: (textEditingValue) {
                        return cubit.searchVehicles(textEditingValue.text);
                      },
                      onSelected: (vehicle) {
                        widget.controller.text = vehicle.licensePlate;
                        _focusNode.unfocus();
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onFieldSubmitted) {
                            return CustomFormField(
                              controller: controller,
                              focusNode: focusNode,
                              borderSide: BorderSide(
                                color: AppColors.borderColor,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              hintText: 'ادخل رقم اللوحة',
                              hintStyle: Theme.of(context).textTheme.bodyLarge,
                              fillColor: Theme.of(context).focusColor,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'من فضلك أدخل رقم لوحة العربية';
                                }
                                return null;
                              },
                            );
                          },
                      optionsViewBuilder: (context, onSelected, options) {
                        final vehicles = options.toList();

                        if (vehicles.isEmpty) {
                          return const SizedBox.shrink();
                        }
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(8),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 220),
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: vehicles.length,
                                separatorBuilder: (_, _) =>
                                    const Divider(height: 1),
                                itemBuilder: (context, index) {
                                  final vehicle = vehicles[index];

                                  return ListTile(
                                    title: Text(
                                      vehicle.licensePlate,
                                      style: Theme.of(context).textTheme.bodyLarge,

                                    ),
                                    subtitle: Text(vehicle.vehicleBrandNameEn),
                                    onTap: () => onSelected(vehicle),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).focusColor,
                      ),
                      onPressed: isLoading
                          ? null
                          : () {
                              if (!cubit.formKey.currentState!.validate()) {
                                return;
                              }

                              cubit.getVehicleDetails(
                                widget.controller.text.trim(),
                              );
                            },
                      child: isLoading
                          ? CircularProgressIndicator()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.search),
                                SizedBox(width: 8),
                                Text(
                                  'بحث عن العربية',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
