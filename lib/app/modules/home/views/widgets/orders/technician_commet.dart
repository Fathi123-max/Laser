import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class TechnicianCommet extends StatelessWidget {
  const TechnicianCommet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Gap(18),
            Text('Technician Comment:',
                textAlign: TextAlign.center,
                style: MyStyles()
                    .languageButtonStyle
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w700)),
          ],
        ),
        Row(
          children: [
            const Gap(18),
            Text('Extra fees was added to clean the camera screen',
                textAlign: TextAlign.center,
                style: MyStyles()
                    .languageButtonStyle
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400)),
          ],
        )
      ],
    );
  }
}
