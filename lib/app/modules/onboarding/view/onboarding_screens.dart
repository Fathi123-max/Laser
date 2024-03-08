// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/routes/app_pages.dart';

import '../../../components/next_button_widget.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final GlobalKey<IntroSliderState> introSliderKey =
      GlobalKey<IntroSliderState>();

  late List<ContentConfig> listContentConfig;

  @override
  void initState() {
    super.initState();
    listContentConfig = [
      ContentConfig(
          widgetDescription: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 97.h,
                width: 256.w,
                child: AutoSizeText(
                    textAlign: TextAlign.center,
                    "A specialized team, highly experienced in \n professionally repairing and maintaining all \n smart devices, ensuring you a premium \n experience.",
                    style: MyStyles().onBordingTextStyle),
              ),
              const Gap(150),
              GestureDetector(
                  onTap: () {
                    introSliderKey.currentState?.tabController.index = 1;
                  },
                  child: Text('Next', style: MyStyles().onBordingButtonStyle))
            ],
          ),
          heightImage: Get.height,
          backgroundImageFit: BoxFit.fill,
          backgroundImage: "assets/images/splash_background.png",
          styleDescription: MyStyles().onBordingTextStyle,
          centerWidget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(100),
              AssetImageView(
                fileName: "logo.png",
                height: 58.h,
                width: 70.w,
              ),
            ],
          ),
          widthImage: Get.width),
      ContentConfig(
          widgetDescription: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 97.h,
                width: 256.w,
                child: AutoSizeText(
                    textAlign: TextAlign.center,
                    '''Highly skilled and 
professional technicians
and Top-quality spare parts''',
                    style: MyStyles()
                        .onBordingTextStyle
                        .copyWith(fontSize: 15.sp)),
              ),
              const Gap(150),
              GestureDetector(
                  onTap: () {
                    introSliderKey.currentState?.tabController.index = 2;
                  },
                  child: Text('Next', style: MyStyles().onBordingButtonStyle))
            ],
          ),
          heightImage: Get.height,
          backgroundImage: "assets/images/splash_background.png",
          styleDescription: MyStyles().onBordingTextStyle,
          centerWidget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(100),
              AssetImageView(
                fileName: "onboarding2.png",
                height: 58.h,
                width: 70.w,
              ),
            ],
          ),
          widthImage: Get.width),
      ContentConfig(
          widgetDescription: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 97.h,
                width: 256.w,
                child: AutoSizeText(
                    textAlign: TextAlign.center,
                    '''Competitive and 
comfortable prices''',
                    style: MyStyles()
                        .onBordingTextStyle
                        .copyWith(fontSize: 15.sp)),
              ),
              const Gap(150),
              GestureDetector(
                  onTap: () {
                    introSliderKey.currentState?.tabController.index = 3;
                  },
                  child: Text('Next', style: MyStyles().onBordingButtonStyle))
            ],
          ),
          heightImage: Get.height,
          backgroundImage: "assets/images/splash_background.png",
          styleDescription: MyStyles().onBordingTextStyle,
          centerWidget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(100),
              AssetImageView(
                fileName: "onboarding3.png",
                height: 58.h,
                width: 70.w,
              ),
            ],
          ),
          widthImage: Get.width),
      ContentConfig(
          widgetDescription: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 97.h,
                width: 256.w,
                child: AutoSizeText(
                    textAlign: TextAlign.center,
                    '''Hassle-free service
right at your doorstep''',
                    style: MyStyles()
                        .onBordingTextStyle
                        .copyWith(fontSize: 15.sp)),
              ),
              const Gap(150),
              NextButtonWidget(
                onTap: () async {
                  MySharedPref.setOnboarding("OnBoardingDone");
                  Get.offAllNamed(Routes.Language);
                },
                style: MyStyles().onBordingButtonStyle,
              )
            ],
          ),
          heightImage: Get.height,
          backgroundImage: "assets/images/splash_background.png",
          styleDescription: MyStyles().onBordingTextStyle,
          centerWidget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(100),
              AssetImageView(
                fileName: "onboarding4.png",
                height: 58.h,
                width: 70.w,
              ),
            ],
          ),
          widthImage: Get.width)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: introSliderKey,
      isScrollable: false,
      isShowDoneBtn: false,
      isShowPrevBtn: false,
      isShowSkipBtn: false,
      nextButtonKey: introSliderKey,
      isShowNextBtn: false,
      listContentConfig: listContentConfig,
    );
  }
}
