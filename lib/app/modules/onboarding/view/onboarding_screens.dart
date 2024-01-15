import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_image_widget.dart';
import 'package:getx_skeleton/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:getx_skeleton/app/modules/splash/controller/splash_screen_controller.dart';

class Onboarding extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/splash_background.png",
            )),
      ),
      child: Column(
        children: [
          SizedBox(height: 220.h),
          AssetImageView(fileName: controller.onboardingIconName.value),
          SizedBox(height: 40.h),
          Text(
            controller.onboardingTextName.value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF908DA9),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0.14,
            ),
          ),
          const Spacer(),
          const Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    ));
  }
}
