import 'package:get/get.dart';
import 'package:laser/app/modules/home/controllers/controller_helper/pick_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<PickController>(
      () => PickController(),
    );
  }
}
