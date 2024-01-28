import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_styles.dart';

import 'device_issues.dart';
import 'device_type.dart';
import 'technician_commet.dart';

class ServiceDetailes extends StatelessWidget {
  const ServiceDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 326.w,
        height: 220.h,
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
            const DeviceType(),
            const Gap(10),
            const DeviceIssues(),
            const Gap(30),
            const TechnicianCommet(),
            const Gap(53),
          ],
        ),
        decoration: MyStyles().shapeDecoration);
  }
}
