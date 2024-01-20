import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_image_widget.dart';

class AuthModelPage extends GetView {
  const AuthModelPage({super.key, required this.authContant});
  final Widget? authContant;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(37),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AssetImageView(
                    fileName: "logo_black.png",
                    width: 56.h,
                    height: 47.w,
                  )
                      .animate(
                        onPlay: (controller) => controller.repeat(),
                      )
                      .shimmer(
                          duration: const Duration(seconds: 3),
                          curve: Curves.easeInQuart),
                ],
              ),
              const Gap(105),
              authContant ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
