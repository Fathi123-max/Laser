import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/components/next_button_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/language/controller/language_controller.dart';
import 'package:laser/app/routes/app_pages.dart';

import 'widgets/language_widget.dart';

class LanguagePage extends GetView<LanguageController> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(105),
          AssetImageView(
            fileName: "Language_icon.png",
            height: 75.h,
            width: 75.w,
          ),
          const Gap(19),
          Text(
            'Language',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: const Color.fromRGBO(24, 22, 35, 1),
                fontFamily: 'Inter',
                fontSize: 15.sp,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.3333333333333333),
          ),
          const Gap(74),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LanguageWidget(lang: "AR"),
              Gap(33),
              LanguageWidget(
                lang: "EN",
              )
            ],
          ),
          const Gap(205),
          NextButtonWidget(
            onTap: () async {
              Get.offNamed(Routes.AuthModelPage);
            },
            style:
                MyStyles().onBordingButtonStyle.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
