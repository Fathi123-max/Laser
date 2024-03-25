import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/my_widgets_animator.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/device_type_widget.dart';
import 'package:laser/app/modules/home/views/widgets/page_banner.dart';

class DeviceTypePage extends GetView<HomeController> {
  const DeviceTypePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MyWidgetsAnimator(
        apiCallStatus: controller.apiDeviceTypesCallStatus.value,
        errorWidget: () => const Center(child: Text('Error')),
        loadingWidget: () => const Center(child: CircularProgressIndicator()),
        successWidget: () => Column(
          children: [
            const Gap(30),
            const PageBanner(
                pageIndex: 1,
                pageTitle: "Device Type",
                pageSubTitle: "Select your device type"),
            const Gap(30),
            Row(
              children: [
                const Gap(43),
                Obx(() => DeviceTypeWidget(
                    onTap: () {
                      controller.controlleDeviceTypeTap(0);
                    },
                    tapped: controller.dviceTypeWidgetTapped[0],
                    fileName: "phone.png",
                    text: controller.deviceTypeList.value[0].name)),
                const Spacer(),
                // Obx(() => DeviceTypeWidget(
                //     fileName: "laptop.png",
                //     tapped: controller.dviceTypeWidgetTapped[1],
                //     onTap: () {
                //       controller.controlleDeviceTypeTap(1);
                //     },
                //     text: controller.deviceTypeList.value[1].name)),
                const Gap(43),
              ],
            ),
            const Gap(19),
            // Row(
            //   children: [
            //     const Gap(43),
            //     Obx(() => DeviceTypeWidget(
            //           tapped: controller.dviceTypeWidgetTapped[2],
            //           fileName: "watch.png",
            //           text: controller.deviceTypeList.value[2].name,
            //           onTap: () {
            //             controller.controlleDeviceTypeTap(2);
            //           },
            //         )),
            //     const Spacer(),
            //     Obx(() => DeviceTypeWidget(
            //         tapped: controller.dviceTypeWidgetTapped[3],
            //         fileName: "ipad.png",
            //         onTap: () {
            //           controller.controlleDeviceTypeTap(3);
            //         },
            //         text: controller.deviceTypeList.value[3].name)),
            //     const Gap(43),
            //   ],
            // ),

            const Gap(24),
            SizedBox(
              width: 273.w,
              child: Text(
                '*If you have more than one device, finish it \n one by one and you can add it after you finish the process.'
                    .tr,
                style: TextStyle(
                  color: const Color(0xFF1B1926),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(10),
          ],
        ),
      );
    });
  }
}
