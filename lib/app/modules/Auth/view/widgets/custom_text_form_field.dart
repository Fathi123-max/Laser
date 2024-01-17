import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/Auth/controller/login_controller.dart';

class CustomTextFormField extends GetWidget<LoginController> {
  const CustomTextFormField({
    Key? key,
    this.textEditingController,
    this.hint,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final String? hint;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(53),
        SizedBox(
          width: 270.w,
          height: 42.h,
          child: TextFormField(
            controller: textEditingController,
            obscureText:
                isPassword ? !controller.isPasswordVisible.value : false,
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
              contentPadding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 12.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
              ),
              suffixIcon: isPassword
                  ? GestureDetector(
                      onTap: () {
                        controller.togglePasswordVisibility();
                      },
                      child: Icon(
                        color: Colors.black,
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
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
