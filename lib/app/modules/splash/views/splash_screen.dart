import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/onboarding/view/onboarding_screens.dart';
import 'package:laser/app/modules/splash/controller/splash_screen_controller.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const OnboardingScreens(),
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
      logoSize: MediaQuery.of(context).size.height,
      imageSrc: "assets/images/splashscreen.png",
    );
  }
}
