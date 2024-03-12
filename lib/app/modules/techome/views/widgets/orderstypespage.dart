import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_loading_overlay.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/modules/techome/controller/techomecontroller.dart';

class OrdersTypesPage extends GetView<TecHomeController> {
  const OrdersTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(92),
          OrderLabel(
            text: "Accepted Orders",
            ontap: () {
              showLoadingOverLay(
                asyncFunction: () {
                  return controller
                      .getAcceptedOrders(
                          lang: LocalizationService.isItEnglish() ? "en" : "ar")
                      .then((value) =>
                          controller.pageController.value.jumpToPage(1));
                },
              );
            },
          ),
          const Gap(21),
          OrderLabel(
            text: "Pending Orders",
            ontap: () {
              showLoadingOverLay(
                asyncFunction: () {
                  return controller
                      .getPendingOrders(
                          lang: LocalizationService.isItEnglish() ? "en" : "ar")
                      .then((value) =>
                          controller.pageController.value.jumpToPage(2));
                },
              );
            },
          ),
          // const Gap(21),
          // OrderLabel(
          //   text: "Finished Orders",
          //   ontap: () {},
          // ),
        ],
      ),
    );
  }
}

class OrderLabel extends StatelessWidget {
  final String text;

  final Function()? ontap;

  const OrderLabel({
    super.key,
    required this.text,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: const Color(0xFF1B1926),
      fontSize: 12.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w800,
    );
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: 313.w,
        height: 66.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
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
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
    );
  }
}
