// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:laser/app/modules/onboarding/controller/onboarding_controller.dart';

class OnboardingScreens extends GetWidget<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: controller.listContentConfig,
      onDonePress: controller.onDonePress,
    );
  }
}
