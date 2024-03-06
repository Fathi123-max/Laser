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
    this.title,
    this.ontap,
  });
  final bool? done;
  final String? fileName;
  final String? title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 200.w,
        height: 50.h,
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
        child: Row(
          children: [
            const Gap(14),
            AssetImageView(
              fileName: fileName ?? "cash.png",
              width: 27.w,
              height: 17.h,
            ),
            const Gap(7),
            Text(title ?? "pay with Credit Card",
                textAlign: TextAlign.center,
                style: MyStyles().languageButtonStyle.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    )),
          ],
        ),
      ),
    );
  }
}
