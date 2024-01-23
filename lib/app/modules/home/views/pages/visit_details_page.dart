import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/Auth/view/widgets/auth_button.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/big_text_filed.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';

class VisitDetailsPage extends StatelessWidget {
  const VisitDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(26),
            Text('Delivery location',
                textAlign: TextAlign.center,
                style: MyStyles().authBigTextStyle.copyWith(
                      color: const Color(0xFF1B1926),
                      fontSize: 12.sp,
                    )),
            const Gap(12),
            BigTextFiled(
              width: 311.w,
            ),
            const Gap(14),
            Text('Technician arrival date',
                textAlign: TextAlign.center,
                style: MyStyles().authBigTextStyle.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1B1926),
                    )),
            Opacity(
              opacity: 0.30,
              child: Text(
                'January, 2024',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF1B1926),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Gap(16),
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              timeLineProps: const EasyTimeLineProps(),
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
              },
              headerProps: const EasyHeaderProps(
                showHeader: false,
              ),
              activeColor: const Color(0xFF1B1D28),
              dayProps: EasyDayProps(
                height: 79.h,
                inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)))),
                todayHighlightStyle: TodayHighlightStyle.withBorder,
                todayHighlightColor: Colors.white,
                todayStyle: DayStyle(
                    splashBorder: BorderRadius.all(Radius.circular(10.r)),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: const Color(0xFF1B1D28)),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)))),
              ),
              locale: "en",
            ),
            const Gap(14),
            Text('Technician arrival time',
                textAlign: TextAlign.center,
                style: MyStyles().languageButtonStyle.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    )),
            const Gap(6),
            Container(
              width: 311.w,
              height: 210.h,
              child: Stack(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const CustomDivider(
                          fullWidth: true,
                        );
                      },
                      itemCount: 2,
                      padding: EdgeInsets.all(10.h),
                      primary: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 38.h,
                          alignment: Alignment.center,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Spacer(),
                                Text(
                                  '11:00 - 12:00',
                                  style:
                                      MyStyles().languageButtonStyle.copyWith(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                ),
                                const Gap(56),
                                Transform.scale(
                                  scale: 1,
                                  child: Checkbox(
                                    value: true,
                                    activeColor: Colors.black,
                                    checkColor: Colors.white,
                                    // Add this line to set the disabled color to grey

                                    shape: const CircleBorder(),
                                    onChanged: (value) {},
                                  ),
                                ),
                              ]),
                        );
                      }),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 50.w,
                      ))
                ],
              ),
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
            ),
            const Gap(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthButton(
                  onPressed: () {
                    Get.find<HomeController>()
                        .pageController
                        .value
                        .nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut)
                        .then((value) => Get.find<HomeController>()
                            .visibilityOfBanner
                            .value = false);
                  },
                  data: "Place Order",
                  height: 37.h,
                  width: 131.w,
                ),
              ],
            ),
            const Gap(63)
          ],
        ),
      ),
    );
  }
}
