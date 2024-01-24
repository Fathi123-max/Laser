import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

import 'custom_appbar_icon.dart';
import 'custom_drawer.dart';
import 'navgation_text_buttons.dart';

class HomeViewModel extends GetView<HomeController> {
  const HomeViewModel({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        key: controller.scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(19),
              Row(children: [
                const Gap(24),
                CustomAppbarIcon(
                  fileName: "drawer.png",
                  height: 15.h,
                  width: 16.w,
                  onTap: () =>
                      controller.scaffoldKey.currentState?.openDrawer(),
                ),
                const Spacer(),
                CustomAppbarIcon(
                  fileName: "message.png",
                  onTap: () {},
                  height: 22.h,
                  width: 22.w,
                ),
                const Gap(15),
                CustomAppbarIcon(
                  onTap: () {},
                  fileName: "list_view.png",
                  height: 25.h,
                  width: 25.w,
                ),
                const Gap(19)
              ]),
              SizedBox(height: 580.h, child: child),
              Row(
                children: [
                  const Gap(50),
                  NavgationTextButtons(
                    text: "Back",
                    onTap: () {
                      controller.pageController.value.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                  ),
                  const Spacer(),
                  NavgationTextButtons(
                    text: "Next",
                    onTap: () {
                      controller.pageController.value.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      if (controller.pageController.value.page == 3) {
                        controller.visibilityOfBanner.value = false;
                      } else {}
                    },
                  ),
                  const Gap(51)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
