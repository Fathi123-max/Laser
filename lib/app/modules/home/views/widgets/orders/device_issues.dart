import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

class DeviceIssues extends GetView<HomeController> {
  const DeviceIssues({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(18),
        Container(
          width: 250.w,
          child: AutoSizeText(controller.serviceDetails.value,
              style: MyStyles().fontSize12Weight400),
        )
      ],
    );
  }
}
