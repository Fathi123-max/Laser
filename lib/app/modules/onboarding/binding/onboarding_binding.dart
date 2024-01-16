import 'package:get/get.dart';
import 'package:laser/app/modules/onboarding/controller/onboarding_controller.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController());
  }
}
