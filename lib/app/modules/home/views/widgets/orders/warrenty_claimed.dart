import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

class WarrentyClaimed extends GetView<HomeController> {
  const WarrentyClaimed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 80.h,
      decoration: MyStyles().shapeDecoration,
      child: Column(
        children: [
          const Gap(22),
          Row(
            children: [
              const Gap(22),
              Text('Warranty claimed',
                  textAlign: TextAlign.center,
                  style: MyStyles().fontSize12Weight700),
              const Spacer(),
              controller.orderDetailsModel.warrantyClaimed! != 0
                  ? AssetImageView(
                      height: 26.h,
                      width: 21.w,
                      fileName: "done.png",
                      // color: Colors.transparent,
                    )
                  : Container(
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF1F0F5),
                        shape: CircleBorder(),
                      ),
                      height: 25.h,
                      width: 31.w,
                    ),
              const Gap(17)
            ],
          ),
          const Gap(6),
          Row(
            children: [
              const Gap(22),
              Container(
                width: 300.w,
                child: AutoSizeText(controller.orderDetailsModel.address!,
                    style: MyStyles().fontSize12Weight400),
              )
            ],
          )
        ],
      ),
    );
  }
}
