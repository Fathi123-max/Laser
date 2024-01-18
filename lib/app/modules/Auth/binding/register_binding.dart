import 'package:get/get.dart';
import 'package:laser/app/modules/Auth/controller/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
