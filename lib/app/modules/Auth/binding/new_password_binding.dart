import 'package:get/get.dart';
import 'package:laser/app/modules/Auth/controller/new_password_controller.dart';

class NewPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPasswordController>(() => NewPasswordController());
  }
}
