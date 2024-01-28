import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class BigTextFiled extends StatelessWidget {
  const BigTextFiled({
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 267.w, // Your custom width
      height: height ?? 97.h, // Your custom height
      decoration: MyStyles().shapeDecoration,
      child: TextField(
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
