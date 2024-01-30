import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_snackbar.dart';
import 'package:laser/app/routes/app_pages.dart';

class CustomTextFormField extends GetWidget {
  const CustomTextFormField({
    super.key,
    this.textEditingController,
    this.keyboardType,
    this.hint,
    this.isPassword = false,
    this.isLogin,
  });

  final TextEditingController? textEditingController;
  final String? hint;
  final bool isPassword;
  final bool? isLogin;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(53),
        SizedBox(
          width: 270.w,
          height: 42.h,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                CustomSnackBar.showCustomErrorSnackBar(
                    title: 'Error',
                    message: 'Please enter $hint',
                    color: Colors.redAccent);
                return "";
              } else {
                return null;
              }
            },
            keyboardType: keyboardType,
            controller: textEditingController,
            obscureText: isPassword ? true : false,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.white,
              filled: true,
              hintStyle: const TextStyle(
                color: Color.fromRGBO(27, 25, 38, 1),
                fontFamily: 'Inter',
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
                borderSide: const BorderSide(color: Colors.black),
              ),
              errorMaxLines: 1,
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
              contentPadding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 12.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
              ),
              suffixIcon: isPassword
                  ? GestureDetector(
                      onTap: () {
                        // controller.togglePasswordVisibility();
                      },
                      child:
                          //  false
                          //     ? Icon(
                          //         color: Colors.black,
                          //         controller.isPasswordVisible.value
                          //             ? Icons.visibility
                          //             : Icons.visibility_off,
                          //       )
                          //     :
                          GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.ForgotPasswordlPage);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 60.w,
                              height: 20.h,
                              child: Row(
                                children: [
                                  Text(
                                    'Forgot?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF1B1926),
                                      fontSize: 12.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
