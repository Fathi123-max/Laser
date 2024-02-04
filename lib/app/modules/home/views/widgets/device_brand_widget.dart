import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laser/app/modules/home/views/widgets/device_type_widget.dart';

class DeviceBrandWidget extends StatelessWidget {
  const DeviceBrandWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        width: 122 + 110 + 110.w,
        child: GridView.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                mainAxisExtent: 80.h,
                childAspectRatio: .5,
                crossAxisCount: 1),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return DeviceTypeWidget(
                  tapped: false,
                  fileName: "apple-logo.png",
                  text: "Apple",
                  height: 70.h,
                  width: 80.w);
            }));
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