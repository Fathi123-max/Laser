import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

class OrderNumber extends GetView<HomeController> {
  const OrderNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Order number #${controller.orderDetailsModel.orderId}',
        textAlign: TextAlign.center,
        style: MyStyles().languageButtonStyle.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ));
  }
}
