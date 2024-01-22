import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavgationTextButtons extends StatelessWidget {
  const NavgationTextButtons({
    Key? key,
    this.onTap,
    required this.text,
  }) : super(key: key);
  final Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
          width: 29.w,
          height: 20.h,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF1B1D28),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              // height: 0.14,
            ),
          )),
    );
  }
}
