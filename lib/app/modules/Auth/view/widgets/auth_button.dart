import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.onPressed,
    this.data,
  });
  final Function()? onPressed;
  final String? data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      width: 270.w,
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          height: 20.h,
          width: 50.w,
          child: AutoSizeText(
            data ?? "Sign in",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
