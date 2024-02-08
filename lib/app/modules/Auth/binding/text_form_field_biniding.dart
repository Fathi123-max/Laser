import 'package:get/get.dart';
import 'package:laser/app/modules/Auth/controller/text_form_fied_controller.dart';

class TextFormFieldBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomTextFormFieldController>(
        () => CustomTextFormFieldController());
  }
}
