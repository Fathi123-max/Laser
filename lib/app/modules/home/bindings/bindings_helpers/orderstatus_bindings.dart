import 'package:get/get.dart';
import 'package:laser/app/modules/home/controllers/controller_helper/controll_order_status.dart';

class OrderStatusBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderStatusController>(() => OrderStatusController());
  }
}
