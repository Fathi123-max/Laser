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
  });
  final Function()? onPressed;
  final String? data;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 42.h,
      width: width ?? 270.w,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        child: SizedBox(
          height: 20.h,
          width: width != null ? 70.w : 50.w,
          child: Center(
            child: AutoSizeText(
              data ?? "Sign in",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
