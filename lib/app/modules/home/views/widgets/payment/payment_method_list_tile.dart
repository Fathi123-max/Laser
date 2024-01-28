import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class PaymentMethodListTile extends StatelessWidget {
  const PaymentMethodListTile({
    super.key,
    this.done,
    this.fileName,
  });
  final bool? done;
  final String? fileName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318.w,
      height: 34.h,
      child: Row(
        children: [
          const Gap(14),
          AssetImageView(
            fileName: fileName ?? "cash.png",
            width: 27.w,
            height: 17.h,
          ),
          const Gap(7),
          Text('Cash on delivery',
              textAlign: TextAlign.center,
              style: MyStyles().languageButtonStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  )),
          const Spacer(),
          Container(
            width: 17.w,
            height: 17.h,
            child: done != null
                ? AssetImageView(
                    fileName: "done.png", height: 35.h, width: 35.w)
                : null,
            decoration: const ShapeDecoration(
              color: Color(0xFFF1F0F5),
              shape: CircleBorder(),
            ),
          ),
          const Gap(12)
        ],
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x02000000),
            blurRadius: 4.r,
            offset: const Offset(0, 4),
            spreadRadius: 1,
          )
        ],
      ),
    );
  }
}
