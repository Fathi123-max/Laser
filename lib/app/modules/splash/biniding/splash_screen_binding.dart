import 'package:get/get.dart';
import 'package:laser/app/modules/splash/controller/splash_screen_controller.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}
