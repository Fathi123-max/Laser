import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/views/widgets/page_banner.dart';

import 'custom_appbar_icon.dart';

class HomeViewModel extends GetView {
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
                    onTap: () => Get.back(),
                  ),
                  const Spacer(),
                  NavgationTextButtons(
                    text: "Next",
                    onTap: () {},
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

class NavgationTextButtons extends StatelessWidget {
  const NavgationTextButtons({
    super.key,
    this.onTap,
    required this.text,
  });
  final Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
          width: 29.w,
          height: 20.h,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF1B1D28),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              // height: 0.14,
            ),
          )),
    );
  }
}
