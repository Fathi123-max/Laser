import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.fullWidth,
    this.color,
  });
  final bool? fullWidth;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? Colors.grey.shade300,
      endIndent: fullWidth != null ? 0 : 37.w,
      indent: fullWidth != null ? 0 : 37.w,
    );
  }
}
