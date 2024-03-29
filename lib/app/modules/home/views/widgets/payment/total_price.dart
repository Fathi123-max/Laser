import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    this.counter,
  });
  final String? counter;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Gap(32),
            Text(
              "Total",
              style: MyStyles().fontSize14WeightBold,
            ),
            const Spacer(),
            Text(
              "${counter.toString()} SAR",
              style: MyStyles().languageButtonStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Gap(28)
          ],
        ),
        Row(
          children: [
            const Gap(32),
            Text(
              "Prices include taxes",
              style: MyStyles().languageButtonStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w200,
                  ),
            ),
          ],
        ),
        const Gap(4),
        const CustomDivider()
      ],
    );
  }
}
