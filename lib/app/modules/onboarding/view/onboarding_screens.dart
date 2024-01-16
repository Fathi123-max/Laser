// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:laser/app/modules/onboarding/controller/onboarding_controller.dart';

class OnboardingScreens extends GetWidget<OnboardingController> {
  const OnboardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: controller.introSliderKey,
      isShowDoneBtn: false,
      isShowPrevBtn: false,
      isShowSkipBtn: false,
      nextButtonKey: controller.introSliderKey,
      isShowNextBtn: false,
      listContentConfig: controller.listContentConfig,
    );
  }
}
