import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class DeviceType extends StatelessWidget {
  const DeviceType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(17),
        Text('Mobiles-iphone 8 plus',
            textAlign: TextAlign.center,
            style: MyStyles()
                .languageButtonStyle
                .copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
