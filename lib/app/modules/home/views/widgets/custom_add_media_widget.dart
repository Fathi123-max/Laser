import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_loading_overlay.dart';
import 'package:laser/app/modules/home/controllers/controller_helper/pick_controller.dart';
import 'package:laser/app/modules/home/views/widgets/device_type_widget.dart';

class CustomAddMediaWidget extends GetWidget<PickController> {
  const CustomAddMediaWidget(
      {super.key, required this.photoName, required this.isvideo});
  final String photoName;
  final bool isvideo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showLoadingOverLay(
            asyncFunction: () =>
                isvideo ? controller.pickVideos() : controller.pickImages());
      },
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DeviceTypeWidget(
            tapped: false,
            fileName: photoName,
            height: 75.h,
            width: 90.w,
            enableMargin: true,
          ),
          Obx(() {
            return Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 20.w,
                height: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black, // Replace with your desired color
                ),
                child: isvideo
                    ? Icon(
                        controller.pickedVideos.value.isNotEmpty
                            ? Icons.check
                            : Icons.add,
                        size: 15.w,
                        color: Colors.white,
                      )
                    : Icon(
                        controller.pickedImages.value.isNotEmpty
                            ? Icons.check
                            : Icons.add,
                        size: 15.w,
                        color: Colors.white,
                      ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
