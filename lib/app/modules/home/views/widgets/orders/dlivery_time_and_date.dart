import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

class DliveryTimeAndDate extends GetView<HomeController> {
  const DliveryTimeAndDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 100.h,
      decoration: MyStyles().shapeDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          Row(
            children: [
              const Gap(24),
              Text('Delivery time and date',
                  textAlign: TextAlign.center,
                  style: MyStyles().fontSize12Weight700),
            ],
          ),
          const Gap(18),
          Row(
            children: [
              const Gap(24),
              AssetImageView(
                width: 14.w,
                height: 11.h,
                fileName: "time.png",
              ),
              const Gap(7),
              Text(controller.orderDetailsModel.time!,
                  style: MyStyles().fontSize12Weight400)
            ],
          ),
          const Gap(10),
          Row(
            children: [
              const Gap(24),
              AssetImageView(
                width: 14.w,
                height: 11.h,
                fileName: "date.png",
              ),
              const Gap(7),
              Text(
                  DateFormat('yyyy-MM-dd')
                      .format(controller.orderDetailsModel.date!)
                      .toString(),
                  style: MyStyles().fontSize12Weight400)
            ],
          )
        ],
      ),
    );
  }
}
