import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/onboarding/controller/onboarding_controller.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
