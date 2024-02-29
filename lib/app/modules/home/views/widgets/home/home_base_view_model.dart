import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

import '../custom_appbar_icon.dart';
import '../custom_drawer.dart';
import '../navgation_text_buttons.dart';

class HomeBaseViewModel extends GetView<HomeController> {
  const HomeBaseViewModel({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.onPopInvokedOrders(context),
      child: SafeArea(
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
                    onTap: () => controller.toOrderList(context),
                    fileName: "list_view.png",
                    height: 25.h,
                    width: 25.w,
                  ),
                  const Gap(19)
                ]),
                SizedBox(height: 550.h, child: child),
                Row(
                  children: [
                    const Gap(50),
                    Obx(() => Visibility(
                          visible: controller.visibilityOfBackButton
                              .value, // Replace isVisible with your visibility condition
                          child: NavgationTextButtons(
                            text: "Back",
                            onTap: () {
                              controller.backButtonLogic();
                            },
                          ),
                        )),
                    const Spacer(),
                    Obx(() => Visibility(
                          visible: controller.visibilityOfNextButton
                              .value, // Replace isVisible with your visibility condition
                          child: NavgationTextButtons(
                            text: "Next",
                            onTap: () {
                              controller.pageController.value.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);

                              // controller.controllVisibilityOfButtons();
                            },
                          ),
                        )),
                    const Gap(51)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
