import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class NumberOfServiceNeeded extends StatelessWidget {
  const NumberOfServiceNeeded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(35),
        Text(
          "Number of services needed",
          style: MyStyles().languageButtonStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
        Spacer(),
        Text(
          "3",
          style: MyStyles().languageButtonStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
        ),
        Gap(28)
      ],
    );
  }
}
