import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/views/widgets/home_model.dart';

import '../../controllers/home_controller.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_expandtile_widget.dart';
import '../widgets/device_brand_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeViewModel(
      child: SizedBox(
        height: 410.h,
        child: PageView(
          children: const [
            // DeviceTypePage(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Gap(20),
                  DeviceBrandWidget(),
                  Gap(25),
                  CustomExpandtileWidget(),
                  CustomDivider(),
                  CustomExpandtileWidget(),
                  CustomDivider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
