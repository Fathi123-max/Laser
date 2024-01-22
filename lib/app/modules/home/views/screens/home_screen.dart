import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/views/widgets/custom_expandtile_widget.dart';
import 'package:laser/app/modules/home/views/widgets/device_type_widget.dart';
import 'package:laser/app/modules/home/views/widgets/home_model.dart';

import '../../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeViewModel(
      child: SizedBox(
        height: 410.h,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            // DeviceTypePage(),
            // DeviceBrandPage(),
            SingleChildScrollView(
              child: Column(
                children: [
                  const CustomExpandtileWidget(),
                  const Gap(19),
                  SizedBox(
                    width: 273.w,
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
                      const Gap(55),
                      Text(
                        'Add photo/ Video',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DeviceTypeWidget(
                        fileName: "pixel-video.png",
                        height: 75.h,
                        width: 90.w,
                      ),
                      const Gap(10),
                      DeviceTypeWidget(
                        fileName: "npixel-camera.png",
                        height: 75.h,
                        width: 90.w,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
