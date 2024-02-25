import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

class TimeDateOrder extends GetView<HomeController> {
  const TimeDateOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        '${DateFormat('EEEE, d MMM yyyy').format(controller.orderDetailsModel.date!)}\n${controller.orderDetailsModel.time!}',
        textAlign: TextAlign.center,
        style: MyStyles().languageButtonStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ));
  }
}
