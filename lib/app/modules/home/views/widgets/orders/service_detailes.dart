import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:laser/app/config/theme/my_styles.dart';

import '../../../controllers/home_controller.dart';
import 'device_issues.dart';
import 'technician_commet.dart';

class ServiceDetailes extends GetView<HomeController> {
  const ServiceDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 326.w,
        height: 220.h,
        decoration: MyStyles().shapeDecoration,
        child: Column(
          children: [
            const Gap(22),
            Row(
              children: [
                const Gap(14),
                Text('Service Details:',
                    textAlign: TextAlign.center,
                    style: MyStyles()
                        .languageButtonStyle
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700))
              ],
            ),
            const Gap(29),

            Row(
              children: [
                const Gap(18),
                Text(
                  '${controller.orderDetailsModel.deviceName}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF1B1926),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            // DeviceTypeWidget(
            //   fileName: "logo_black.png",
            //   tapped: false,
            // ),
            const Gap(10),
            const DeviceIssues(),
            const Gap(30),
            const TechnicianCommet(),
            const Gap(53),
          ],
        ));
  }
}
