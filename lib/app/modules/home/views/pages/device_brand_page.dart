import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';
import 'package:laser/app/modules/home/views/widgets/device_brand_widget.dart';
import 'package:laser/app/modules/home/views/widgets/expanded_tiles/custom_expandtile_device_color.dart';
import 'package:laser/app/modules/home/views/widgets/expanded_tiles/custom_expandtile_widget_device_model.dart';
import 'package:laser/app/modules/home/views/widgets/page_banner.dart';

class DeviceBrandPage extends GetWidget<HomeController> {
  const DeviceBrandPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.brandScrollController,
      child: Column(
        children: [
          const Gap(30),
          const PageBanner(
              pageIndex: 2,
              pageTitle: "Device Brand",
              pageSubTitle: "Select your device brand"),
          const Gap(20),
          const DeviceBrandWidget(),
          const Gap(25),
          Obx(() {
            return Visibility(
                visible: controller.deviceModelVisibleController.value,
                child: const Column(
                  children: [
                    DeviceModelExpandtileWidget(),
                    CustomDivider(),
                  ],
                ));
          }),
          Obx(() {
            return Visibility(
                visible: controller.deviceColorVisibleController.value,
                child: const Column(
                  children: [
                    DeviceColorExpandtileWidget(
                      isWidgetColorVisible: true,
                    ),
                    CustomDivider(),
                  ],
                ));
          }),
        ],
      ),
    );
  }
}
