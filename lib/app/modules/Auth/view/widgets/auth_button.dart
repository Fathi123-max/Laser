import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.onPressed,
    this.data,
    this.width,
    this.height,
    this.fontSize,
  });
  final Function()? onPressed;
  final String? data;
  final double? width;
  final double? height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      child: SizedBox(
        height: height ?? 42.h,
        width: width ?? 270.w,
        child: Center(
          child: AutoSizeText(
            data ?? "Sign in",
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
