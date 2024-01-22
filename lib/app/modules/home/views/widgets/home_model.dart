import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/page_banner.dart';

import 'custom_appbar_icon.dart';
import 'navgation_text_buttons.dart';

class HomeViewModel extends GetView<HomeController> {
  const HomeViewModel({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
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
                  onTap: () => scaffoldKey.currentState?.openDrawer(),
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
              const Gap(30),
              const PageBanner(
                  pageIndex: 1,
                  pageTitle: "Device Type",
                  pageSubTitle: "Select your device type"),
              child,
              Row(
                children: [
                  const Gap(50),
                  NavgationTextButtons(
                    text: "Back",
                    onTap: () {
                      controller.pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                  ),
                  const Spacer(),
                  NavgationTextButtons(
                    text: "Next",
                    onTap: () {
                      controller.pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
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
