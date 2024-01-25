import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class OrderPrice extends StatelessWidget {
  const OrderPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(40),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'Total ',
                  style: MyStyles().languageButtonStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      )),
              TextSpan(
                  text: '300 SAR',
                  style: MyStyles().languageButtonStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      )),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(56),
        const Text(
          "|",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(52),
        AssetImageView(
          height: 17.h,
          width: 27.w,
          fileName: "cash.png",
          // color: Colors.transparent,
        ),
        const Gap(7),
        Text('Paid in cash',
            textAlign: TextAlign.center,
            style: MyStyles().languageButtonStyle.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ))
      ],
    );
  }
}
