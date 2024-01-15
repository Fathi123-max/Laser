import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_image_widget.dart';
import 'package:getx_skeleton/app/modules/splash/controller/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
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
      child: const AssetImageView(fileName: "logo.png"),
    ));
  }
}
