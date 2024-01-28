import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';

import 'custom_card_button.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 13.h),
      child: Container(
        width: 300.w,
        height: 185.h,
        child: Column(children: [
          Gap(13.h),
          Row(
            children: [
              const Gap(24),
              Text('Order number 226',
                  textAlign: TextAlign.center,
                  style: MyStyles().fontSize12Weight700),
              const Spacer(),
              CustomCardButton(
                text: "Details",
                color: const Color(0xFFF1F0F5),
                onTap: () {},
              ),
              const Gap(12)
            ],
          ),
          const Gap(19),
          Row(
            children: [
              const Gap(28),
              AssetImageView(fileName: "phone.png", height: 26.h, width: 20.w),
              const Gap(31),
              Text('Mobiles-iphone 8 plus',
                  textAlign: TextAlign.center,
                  style: MyStyles().fontSize12Weight400)
            ],
          ),
          const Gap(13),
          Row(children: [
            const Gap(24),
            Text(
              'Issue',
              textAlign: TextAlign.center,
              style: MyStyles().fontSize12Weight400,
            ),
            const Gap(25),
            Text('Checking',
                textAlign: TextAlign.center,
                style: MyStyles()
                    .languageButtonStyle
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400))
          ]),
          Gap(18.h),
          const CustomDivider(fullWidth: true),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCardButton(
                width: 74.sp,
                heaight: 22.h,
                text: "Pending",
                color: const Color(0xFFFFEB3C),
                onTap: () {},
              ),
              const Gap(12),
              CustomCardButton(
                heaight: 22.h,
                width: 96.sp,
                text: "Cancel Order",
                color: const Color(0xFFF1F0F5),
                onTap: () {},
              ),
              const Gap(13),
              Text('Total ', style: MyStyles().fontSize12Weight400),
              const Text(
                '200 SAR',
                style: TextStyle(
                  color: Color(0xFF1B1926),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0.10,
                ),
              ),
            ],
          ),
          const Gap(19)
        ]),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x02000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 1,
            )
          ],
        ),
      ),
    );
  }
}
