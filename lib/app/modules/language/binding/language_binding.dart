import 'package:get/get.dart';
import 'package:laser/app/modules/language/controller/language_controller.dart';

class LanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
