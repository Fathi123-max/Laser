import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/custom_add_media_widget.dart';
import 'package:laser/app/modules/home/views/widgets/expanded_tiles/custom_expandedtile_widget_services.dart';
import 'package:laser/app/modules/home/views/widgets/page_banner.dart';

import '../widgets/big_text_filed.dart';

class ServicePage extends GetView<HomeController> {
  const ServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.serviceScrollController,
      child: Column(
        children: [
          const Gap(30),
          const PageBanner(
              pageIndex: 3,
              pageTitle: "Service",
              pageSubTitle: "Select your device type"),
          const ServisesExpandtileWidget(),
          const Gap(19),
          SizedBox(
            width: 280.w,
            child: Text(
              'You can add a pic or video of your device if \nneeded here!'.tr,
              style: TextStyle(
                color: const Color(0xFF1B1926),
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Gap(28),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(50),
              Text('Add photo/ Video'.tr,
                  textAlign: TextAlign.center,
                  style: MyStyles().fontSize14WeightBold),
            ],
          ),
          const Gap(15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAddMediaWidget(photoName: "pixel-video.png"),
              Gap(10),
              CustomAddMediaWidget(photoName: "npixel-camera.png"),
            ],
          ),
          const Gap(26),
          Row(
            children: [
              const Gap(55),
              Text(
                'Problem Information if needed',
                textAlign: TextAlign.center,
                style: MyStyles()
                    .languageButtonStyle
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const Gap(14),
          const BigTextFiled(),
          const Gap(41)
        ],
      ),
    );
  }
}
