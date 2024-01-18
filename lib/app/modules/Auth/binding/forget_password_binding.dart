import 'package:get/get.dart';
import 'package:laser/app/modules/Auth/controller/forget_password_controller.dart';

class ForgotBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotController>(() => ForgotController());
  }
}
