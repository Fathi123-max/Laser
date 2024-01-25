import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class WarrentyClaimed extends StatelessWidget {
  const WarrentyClaimed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 80.h,
      child: Column(
        children: [
          const Gap(22),
          Row(
            children: [
              const Gap(22),
              Text('Warranty claimed',
                  textAlign: TextAlign.center,
                  style: MyStyles().languageButtonStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      )),
              const Spacer(),
              AssetImageView(
                height: 26.h,
                width: 21.w,
                fileName: "done.png",
                // color: Colors.transparent,
              ),
              const Gap(17)
            ],
          ),
          const Gap(6),
          Row(
            children: [
              const Gap(22),
              Text('Alrehab District, Jeddah, Saudi Arabia',
                  style: MyStyles()
                      .languageButtonStyle
                      .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400)),
            ],
          )
        ],
      ),
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
    );
  }
}
