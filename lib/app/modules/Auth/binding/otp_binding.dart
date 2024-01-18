import 'package:get/get.dart';
import 'package:laser/app/modules/Auth/controller/otp_controller.dart';

class OtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}
