import 'package:get/get.dart';
import 'package:laser/app/modules/onboarding/binding/onboarding_binding.dart';
import 'package:laser/app/modules/splash/biniding/splash_screen_binding.dart';

class OnStartBinding implements Bindings {
  @override
  void dependencies() {
    SplashScreenBinding().dependencies();
    OnboardingBinding().dependencies();
  }
}
