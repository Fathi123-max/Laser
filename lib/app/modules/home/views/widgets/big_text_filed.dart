import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

class BigTextFiled extends GetView<HomeController> {
  const BigTextFiled({
    this.isNote,
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;
  final bool? isNote;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 267.w, // Your custom width
      height: height ?? 97.h, // Your custom height
      decoration: MyStyles().shapeDecoration,
      child: TextField(
        controller: isNote == false
            ? controller.addressController
            : controller.noteController,
        maxLines: 50,
        decoration: InputDecoration(
          hintText: "Add your address here...",
          filled: true,
          hintStyle: const TextStyle(
            color: Color(0xFF1B1926),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0.14,
          ),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide:
                BorderSide.none, // Use BorderSide.none to remove the border
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w, vertical: 8.h), // Adjust padding as needed
        ),
        style: TextStyle(
          fontSize: 14.sp, // Use your custom font size
        ),
      ),
    );
  }
}
