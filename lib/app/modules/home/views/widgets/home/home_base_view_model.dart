import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/techome/controller/techomecontroller.dart';

import '../custom_appbar_icon.dart';
import '../custom_drawer.dart';

class HomeBaseViewModel extends GetView<TecHomeController> {
  const HomeBaseViewModel({required this.child, super.key});
  final Widget child;
  final GlobalObjectKey<ScaffoldState> scaffoldKey =
      const GlobalObjectKey<ScaffoldState>("ScaffoldKey");
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // onWillPop: () => controller.onPopInvokedOrders(context),
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          drawer: const CustomDrawer(),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const Gap(19),
                Row(children: [
                  const Gap(24),
                  Builder(builder: (context) {
                    return CustomAppbarIcon(
                      fileName: "drawer.png",
                      height: 15.h,
                      width: 16.w,
                      onTap: () => Scaffold.of(context).openDrawer(),
                    );
                  }),
                  const Spacer(),
                  // CustomAppbarIcon(
                  //   fileName: "message.png",
                  //   onTap: () {},
                  //   height: 22.h,
                  //   width: 22.w,
                  // ),
                  const Gap(15),
                  CustomAppbarIcon(
                    // onTap: () => controller.toOrderList(context),
                    fileName: "list_view.png"
                    // : "home.png"

                    ,
                    height: 22.h,
                    width: 22.w,
                  ),
                  const Gap(19)
                ]),
                SizedBox(
                    height: (0.9 * MediaQuery.of(context).size.height)
                        .roundToDouble(),
                    child: child),
                // Row(
                //   children: [
                //     const Gap(50),
                //     Obx(() => Visibility(
                //           visible: controller.visibilityOfBackButton
                //               .value, // Replace isVisible with your visibility condition
                //           child: NavgationTextButtons(
                //             text: "Back",
                //             onTap: () {
                //               controller.backButtonLogic();
                //             },
                //           ),
                //         )),
                //     const Spacer(),
                //     Obx(() => Visibility(
                //           visible: controller.visibilityOfNextButton
                //               .value, // Replace isVisible with your visibility condition
                //           child: NavgationTextButtons(
                //             text: "Next",
                //             onTap: () {
                //               controller.pageController.value.nextPage(
                //                   duration: const Duration(milliseconds: 500),
                //                   curve: Curves.easeInOut);

                //               // controller.controllVisibilityOfButtons();
                //             },
                //           ),
                //         )),
                //     const Gap(51)
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
