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
        height: 150.h,
        width: 122 + 110 + 110,
        child: GridView.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                mainAxisExtent: 137.h,
                childAspectRatio: .7,
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return DeviceTypeWidget(
                  fileName: "apple-logo.png",
                  text: "Apple",
                  height: 137.h,
                  width: 101.w);
            }));
  }
}
