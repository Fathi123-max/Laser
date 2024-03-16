import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/Auth/controller/text_form_fied_controller.dart';
import 'package:laser/app/modules/techome/controller/techomecontroller.dart';

class HoldCustomDialogFiled extends GetWidget<CustomTextFormFieldController> {
  const HoldCustomDialogFiled({
    this.isRigter,
    super.key,
    this.keyboardType,
    this.hint,
    this.isPassword = false,
  });

  final String? hint;
  final bool isPassword;
  final bool? isRigter;

  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 180.w,
          height: isRigter! ? 91.h : 35.h,
          child: Obx(() {
            return TextField(
              maxLines: 1000,
              keyboardType: keyboardType,
              controller: Get.find<TecHomeController>()
                  .techMessageEditingController
                  .value,
              obscureText: controller.isPasswordVisible.value && isPassword
                  ? true
                  : false,
              decoration: InputDecoration(
                hintText: hint,
                fillColor: const Color(0xFFF1F0F5),
                filled: true,
                hintStyle: TextStyle(
                  color: const Color(0xFF1B1926),
                  fontSize: isRigter! ? 13.sp : 15.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  // height: 0.08,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                errorMaxLines: 1,
                hintMaxLines: 3,
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                errorStyle: const TextStyle(
                  height: 0,
                  color: Color.fromRGBO(27, 25, 38, 1),
                  fontFamily: 'Inter',
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                ),
                contentPadding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 0.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
