import 'package:get/get.dart';
import 'package:laser/app/modules/home/controllers/controller_helper/pick_controller.dart';
import 'package:laser/app/modules/techome/controller/techomecontroller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TecHomeController>(
      () => TecHomeController(),
    );
    Get.lazyPut<PickController>(
      () => PickController(),
    );
  }
}
