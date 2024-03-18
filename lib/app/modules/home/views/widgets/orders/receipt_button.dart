import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/payment/payment_receipt.dart';

class ReceiptButton extends GetView<HomeController> {
  const ReceiptButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.off(() => const ReceptPage());
      },
      child: Container(
        width: 131.w,
        height: 27.h,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: const Color(0xFF1B1D28),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text('View receipt',
            textAlign: TextAlign.center,
            style: MyStyles().fontSize12Weight400.copyWith(
                  color: Colors.white,
                )),
      ),
    );
  }
}
