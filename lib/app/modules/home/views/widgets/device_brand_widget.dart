import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/my_widgets_animator.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/device_type_widget.dart';

class DeviceBrandWidget extends GetWidget<HomeController> {
  const DeviceBrandWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MyWidgetsAnimator(
        apiCallStatus: controller.apiDeviceBrandsCallStatus.value,
        loadingWidget: () => const Center(child: CircularProgressIndicator()),
        errorWidget: () => const Center(child: Text('Error')),
        successWidget: () => SizedBox(
            height: 100.h,
            width: 122 + 110 + 80.w,
            child: GridView.builder(
                itemCount: controller.deviceBrandList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    mainAxisExtent: 80.h,
                    childAspectRatio: .3,
                    crossAxisCount: 1),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.controlleDeviceBrandTap(index);
                    },
                    child: Obx(() {
                      return DeviceTypeWidget(
                          tapped:
                              controller.dviceBrandWidgetTapped[index].value,
                          fileName: "apple-logo.png",
                          text: controller.deviceBrandList![index].name,
                          height: 70.h,
                          width: 80.w);
                    }),
                  );
                })),
      );
    });
  }
}

// horizntal

/**
 * import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laser/app/modules/home/views/widgets/device_type_widget.dart';

class DeviceBrandWidget extends StatelessWidget {
  const DeviceBrandWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150.h,
        width: 122 + 110 + 110.w,
        child: GridView.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                mainAxisExtent: 137.h,
                childAspectRatio: .7,
                crossAxisCount: 1),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return DeviceTypeWidget(
                  fileName: "apple-logo.png",
                  text: "Apple",
                  height: 137.h,
                  width: 101.w);
            }));
  }
}

 */