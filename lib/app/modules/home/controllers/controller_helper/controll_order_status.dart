import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_loading_overlay.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/data/models/order_model.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/pages/payment_details_page.dart';
import 'package:laser/app/modules/home/views/pages/update_order.dart';
import 'package:laser/app/modules/home/views/widgets/home/home_base_view_model.dart';

class OrderStatusController extends GetxController {
  controlOrderStatusButton(OrderModel order, BuildContext context) {
    switch (order.currentStatusName) {
      case "Pending":
        return () {
          Get.dialog(
            //create an alart dialog for cancel order
            AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 50.w),
              backgroundColor: const Color(0xFFF1F0F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              title: const Text(
                'Cancel Order',
                style: TextStyle(color: Color(0xFF1B1926)),
              ),
              content: const Text(
                'Are you sure you want to cancel this order?',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    showLoadingOverLay(
                      asyncFunction: () =>
                          Get.find<HomeController>().cancelOrder(
                        lang: LocalizationService.isItEnglish() ? "en" : "ar",
                        orderId: order.orderId!,
                      ),
                    );
                    Get.back();
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          );
        };
      case "Accepted":
        return () async {
          Get.find<HomeController>().paymentScreenDetailsUrl().then((value) =>
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeBaseViewModel(
                          child: PaymentDetailsPage(order: order)))));
        };
      case "Paid":
        return () {};
      case "On Hold":
        return () {
          Get.defaultDialog(
            title: "",
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.green,
            titlePadding: EdgeInsets.zero,
            content: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x02000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 1,
                  )
                ],
              ),
              height: Get.height * .75,
              width: Get.width,
              child: UpdateOrderPage(
                key: const ValueKey("UpdateOrderPage"),
                order: order,
              ),
            ),
          );
        };
      case "Updated":
        return () async {
          // Initiates a payment with a card using the FlutterPaymob instance
          Get.find<HomeController>().paymentScreenDetailsUrl().then((value) =>
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeBaseViewModel(
                          key: GlobalObjectKey("payment details"),
                          child: PaymentDetailsPage(order: order)))));
        };
      case "Finished":
        return () {};
      default:
        return null;
    }
  }
}
