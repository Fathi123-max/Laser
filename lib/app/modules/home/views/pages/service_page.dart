import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/views/widgets/custom_add_media_widget.dart';
import 'package:laser/app/modules/home/views/widgets/custom_expandtile_widget.dart';

import '../widgets/big_text_filed.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomExpandtileWidget(),
          const Gap(19),
          SizedBox(
            width: 280.w,
            child: Text(
              'You can add a pic or video of your device if \nneeded here!',
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
              Text(
                'Add photo/ Video',
                textAlign: TextAlign.center,
                style: MyStyles().languageButtonStyle.copyWith(
                      fontSize: 14.sp,
                    ),
              ),
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
