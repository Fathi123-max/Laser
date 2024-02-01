import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/splash/controller/splash_screen_controller.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      controller.checkCardintial();
    });
    return SplashScreenView(
      navigateRoute: Container(),
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
      logoSize: MediaQuery.of(context).size.height,
      imageSrc: "assets/images/splashscreen.png",
      navigateWhere: false,
      duration: const Duration(seconds: 3),
    );
  }
}
