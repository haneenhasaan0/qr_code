import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/core/provider/app_theme_provider.dart';
import 'package:qr_code/core/widget/snack_bar.dart';
import 'package:qr_code/features/trips/presentation/cubit/trips_cubit.dart';
import 'package:qr_code/features/trips/presentation/cubit/trips_states.dart';
import 'package:qr_code/features/trips/presentation/widget/show_more.dart';

import '../../../../core/app_colors/app_colors.dart';

class TripDetailsContainer extends StatefulWidget {
  const TripDetailsContainer({
    super.key,
    required this.start,
    required this.end,
    required this.driverName,
  });

  final DateTime start;
  final DateTime end;
  final String driverName;

  @override
  State<TripDetailsContainer> createState() => _TripDetailsContainerState();
}

bool more = false;
class _TripDetailsContainerState extends State<TripDetailsContainer> {
  final Set<int> isExpand={};

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return BlocProvider(
      create: (context) {
        return TripsCubit()
          ..start = DateFormat('yyyy-MM-dd').format(widget.start)
          ..end = DateFormat('yyyy-MM-dd').format(widget.end)
          ..getTripDetails(widget.driverName);
      },
      child: BlocConsumer<TripsCubit, TripsStates>(
        listener:(context,state){
          if (state is TripsLoadingState) {
           return showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          print("STATE = ${state.runtimeType}");

          if (state is TripsEmptyState) {
            return SizedBox(
              height: 80,
              child:  Text(
              textAlign: TextAlign.center,
                  "لا توجد رحلات في هذا الشهر",
                  style: AppStyles.bold.copyWith(
                    color: themeProvider.themeMode == ThemeMode.dark
                        ? AppColors.whiteColor
                        : AppColors.darkBlueColor,

                ),
              ),
            );
          }
          if (state is TripsSuccessState) {
            final trips = state.tripsResponse;
            final startDate = state.tripsResponse?.first.startDate;
            print("SUCCESS");
            print("TRIPS COUNT = ${state.tripsResponse?.length??0}");

            return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: trips?.length??0,
              separatorBuilder: (context, index) {
                return SizedBox(height: 6);
              },
              itemBuilder: (context, index) {
                bool expand=isExpand.contains(trips?[index].tripId);

                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeProvider.themeMode == ThemeMode.dark
                          ? AppColors.darkBlueColor
                          : AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: themeProvider.themeMode == ThemeMode.dark
                              ? Colors.black
                              : AppColors.whiteColor,
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "كود الرحلة ${trips?[index].tripId}",
                                style: AppStyles.bold.copyWith(
                                  fontSize: 16,
                                  color:
                                      themeProvider.themeMode == ThemeMode.dark
                                      ? AppColors.whiteColor
                                      : Colors.black,
                                ),
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFFE7F6EF),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    trips?[index].statusGroupAr??"",
                                    style: AppStyles.extraBold32.copyWith(
                                      color: AppColors.darkGreenColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            "اسم الرحلة ${trips?[index].tripName}",
                            style: AppStyles.bold.copyWith(
                              fontSize: 16,
                              color: themeProvider.themeMode == ThemeMode.dark
                                  ? AppColors.whiteColor
                                  : AppColors.darkBlueColor,
                            ),
                          ),
                          Text(
                            trips?[index].tripStatusAr??"",
                            style: AppStyles.semiBold.copyWith(
                              fontSize: 12,
                              color: AppColors.textColor,
                            ),
                          ),
                          SizedBox(height: 4),

                          if (expand) ...[
                            Divider(
                              color: AppColors.borderColor,
                              endIndent: 10,
                              indent: 10,
                            ),
                            SizedBox(height: 8),

                            Text(
                              "قطاع الاعمال",
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: AppColors.textColor,
                              ),
                            ),
                            Text(
                              state.tripsResponse?.first.businessSectorNameAr??"",
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? AppColors.whiteColor
                                    : AppColors.darkBlueColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "رقم أمر البيع",
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: AppColors.textColor,
                              ),
                            ),
                            Text(
                              trips?[index].salesOrderId ?? "",
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? AppColors.whiteColor
                                    : AppColors.darkBlueColor,
                              ),
                            ),
                            const SizedBox(height: 16),

                            Text(
                              "اسم المشروع",
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: AppColors.textColor,
                              ),
                            ),

                            Text(
                              trips?[index].projectNameEn ?? "",
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? AppColors.whiteColor
                                    : AppColors.darkBlueColor,
                              ),
                            ),

                            const SizedBox(height: 16),
                            Text(
                              "كود المشروع",
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: AppColors.textColor,
                              ),
                            ),

                            Text(
                              trips?[index].projectIdStr??"",
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? AppColors.whiteColor
                                    : AppColors.darkBlueColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "اسم السائق",
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: AppColors.textColor,
                              ),
                            ),

                            Text(
                              trips?[index].driverName ?? "",
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? AppColors.whiteColor
                                    : AppColors.darkBlueColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "رقم لوحة المركبة",
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: AppColors.textColor,
                              ),
                            ),

                            Text(
                              state.tripsResponse?.first.vehiclePlateNumber??'',
                              style: AppStyles.semiBold.copyWith(
                                fontSize: 16,
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? AppColors.whiteColor
                                    : AppColors.darkBlueColor,
                              ),
                            ),
                            const SizedBox(height: 16),

                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      "اعتماد DV",
                                      style: AppStyles.semiBold.copyWith(
                                        fontSize: 16,
                                        color: AppColors.textColor,
                                      ),
                                    ),

                                    Text(
                                      trips?[index].isDvApproved == true
                                          ? "نعم"
                                          : "لا",
                                      style: AppStyles.semiBold.copyWith(
                                        fontSize: 16,
                                        color: AppColors.darkGreenColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      "اعتماد المندوب",
                                      style: AppStyles.semiBold.copyWith(
                                        fontSize: 16,
                                        color: AppColors.textColor,
                                      ),
                                    ),

                                    Text(
                                      trips?[index].isAccApproved == true
                                          ? "نعم"
                                          : "لا",

                                      style: AppStyles.semiBold.copyWith(
                                        fontSize: 16,
                                        color: AppColors.darkGreenColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "أنشأ بواسطة",
                                      style: AppStyles.semiBold.copyWith(
                                        fontSize: 16,
                                        color: AppColors.textColor,
                                      ),
                                    ),

                                    Text(
                                      trips![index].createdBy.length >= 10
                                          ? trips[index].createdBy.substring(
                                              0,
                                              10,
                                            )
                                          : trips[index].createdBy,

                                      style: AppStyles.semiBold.copyWith(
                                        fontSize: 16,
                                        color:
                                            themeProvider.themeMode ==
                                                ThemeMode.dark
                                            ? AppColors.whiteColor
                                            : AppColors.darkBlueColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      "تاريخ البدء",
                                      style: AppStyles.semiBold.copyWith(
                                        fontSize: 16,
                                        color: AppColors.textColor,
                                      ),
                                    ),

                                    Text(
                                      startDate != null
                                          ? DateFormat(
                                              'dd/MM/yyyy - HH:mm',
                                            ).format(startDate)
                                          : "",

                                      style: AppStyles.semiBold.copyWith(
                                        fontSize: 16,
                                        color:
                                            themeProvider.themeMode ==
                                                ThemeMode.dark
                                            ? AppColors.whiteColor
                                            : AppColors.darkBlueColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(expand) {
                                  isExpand.remove(trips![index].tripId);
                                }
                                else{
                                   isExpand.add(trips![index].tripId);
                                }
                              });
                            },
                            child: ShowMore(more: expand,),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
