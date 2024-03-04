import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laser/app/components/custom_loading_overlay.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/modules/Auth/view/widgets/auth_button.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/big_text_filed.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';
import 'package:laser/app/modules/home/views/widgets/page_banner.dart';

class VisitDetailsPage extends GetWidget<HomeController> {
  const VisitDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.hoursScrollController,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(30),
            PageBanner(
                pageIndex: 4,
                pageTitle: "Visit Details".tr,
                pageSubTitle: "Please add information needed".tr),
            const Gap(26),
            Row(
              children: [
                Gap(13.w),
                Text('Delivery Location'.tr,
                    textAlign: TextAlign.center,
                    style: MyStyles().authBigTextStyle.copyWith(
                          color: const Color(0xFF1B1926),
                          fontSize: 12.sp,
                        )),
              ],
            ),
            const Gap(12),
            BigTextFiled(
              isNote: false,
              width: 300.w,
            ),
            const Gap(14),
            Row(
              children: [
                Gap(13.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Technician arrival date'.tr,
                        textAlign: TextAlign.center,
                        style: MyStyles()
                            .fontSize12Weight700
                            .copyWith(color: const Color(0xFF1B1926))),
                    Opacity(
                      opacity: 0.30,
                      child: Text(
                        DateFormat('MMMM, yyyy').format(DateTime.now()),
                        textAlign: TextAlign.start,
                        style: MyStyles().fontSize12Weight400.copyWith(
                              color: const Color(0xFF1B1926),
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(16),
            Obx(() {
              return EasyInfiniteDateTimeLine(
                showTimelineHeader: false,
                focusDate: controller.dateTime.value,

                controller: EasyInfiniteDateTimelineController(),
                lastDate: DateTime.now().add(const Duration(days: 60)),
                firstDate: DateTime.now(),

                timeLineProps: const EasyTimeLineProps(),
                onDateChange: (selectedDate) =>
                    controller.controlleDate(selectedDate),
                // headerProps: const EasyHeaderProps(
                //   showHeader: false,
                // ),
                activeColor: const Color(0xFF1B1D28),

                dayProps: EasyDayProps(
                  height: 79.h,
                  inactiveDayStyle: DayStyle(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r)))),
                  todayHighlightStyle: TodayHighlightStyle.withBorder,
                  todayHighlightColor: Colors.white,
                  todayStyle: DayStyle(
                      splashBorder: BorderRadius.all(Radius.circular(10.r)),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: const Color(0xFF1B1D28)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r)))),
                ),
                locale: LocalizationService.isItEnglish() ? "en" : "ar",
              );
            }),
            const Gap(14),
            Row(
              children: [
                Gap(13.w),
                Text('Technician arrival time'.tr,
                    textAlign: TextAlign.center,
                    style: MyStyles().languageButtonStyle.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        )),
              ],
            ),
            const Gap(6),
            Container(
              width: 311.w,
              height: 210.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x02000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Stack(
                children: [
                  Obx(() {
                    return controller.hoursList.value.length == 0
                        ? Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Click Date to Show Hours".tr,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 23.sp),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return const CustomDivider(
                                fullWidth: true,
                              );
                            },
                            itemCount: controller.hoursList.value.length,
                            padding: EdgeInsets.all(10.h),
                            primary: true,
                            itemBuilder: (context, index) {
                              return Obx(() {
                                bool isActive =
                                    controller.activeHoureIndex.value == index;
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    controller.setHoursIndex(index);
                                  },
                                  child: Container(
                                    height: 38.h,
                                    alignment: Alignment.center,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Spacer(),
                                          Text(
                                            controller.hoursList.value[index]
                                                .toString()
                                                .toString(),
                                            style: MyStyles()
                                                .languageButtonStyle
                                                .copyWith(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          const Gap(56),
                                          Transform.scale(
                                            scale: 1,
                                            child: Checkbox(
                                              value: isActive,
                                              activeColor: Colors.black,
                                              checkColor: Colors.white,
                                              // Add this line to set the disabled color to grey

                                              shape: const CircleBorder(),
                                              onChanged: (value) {
                                                controller.setHoursIndex(index);
                                              },
                                            ),
                                          ),
                                        ]),
                                  ),
                                );
                              });
                            });
                  }),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 50.w,
                      ))
                ],
              ),
            ),
            const Gap(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthButton(
                  onPressed: () {
                    showLoadingOverLay(asyncFunction: () {
                      return controller.createOrder(
                          lang:
                              LocalizationService.isItEnglish() ? "en" : "ar");
                    });
                  },
                  data: "Place Order".tr,
                  height: 37.h,
                  width: 131.w,
                ),
              ],
            ),
            // const Gap(63)
          ],
        ),
      ),
    );
  }
}
