import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:laser/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  List<ContentConfig> listContentConfig = [];
  GetStorage prefs = GetStorage();
  OnboardingController onBoardingController = Get.find<OnboardingController>();

  // @override
  // void initState() {
  //   super.initState();
  //   addBoardingImages();
  // }

  void addBoardingImages() {
    // listContentConfig.addAll(widget.customImages ??
    //     onBoardingController.photos.value
    //         .map((e) => ContentConfig(
    //               backgroundImageFit: BoxFit.fill,
    //               backgroundNetworkImage: e,
    //             ))
    //         .toList());
  }

  void onDonePress() async {}
}
