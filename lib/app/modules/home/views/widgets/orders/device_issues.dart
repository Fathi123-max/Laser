import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class DeviceIssues extends StatelessWidget {
  const DeviceIssues({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(18),
        Text(
            'Phoen screen replaced - Original - 50 SAR \nBattery replaced - 150 SAR',
            style: MyStyles()
                .languageButtonStyle
                .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400))
      ],
    );
  }
}
