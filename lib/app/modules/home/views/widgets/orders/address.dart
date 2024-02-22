import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

class Address extends GetView<HomeController> {
  const Address({
    super.key,
    this.customWidth,
  });
  final double? customWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: customWidth ?? 300.w,
      height: 80.h,
      decoration: MyStyles().shapeDecoration,
      child: Column(
        children: [
          const Gap(14),
          Row(
            children: [
              const Gap(24),
              Text('Address',
                  textAlign: TextAlign.center,
                  style: MyStyles().languageButtonStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      )),
            ],
          ),
          const Gap(14),
          Row(
            children: [
              const Gap(24),
              AssetImageView(
                fileName: "location.png",
                width: 21.w,
                height: 17.h,
              ),
              const Gap(4),
              Text(controller.orderDetailsModel.address!,
                  style: MyStyles().fontSize12Weight400)
            ],
          )
        ],
      ),
    );
  }
}
