import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.fullWidth,
    this.color,
    this.height,
    this.thickness,
  });
  final bool? fullWidth;
  final Color? color;
  final double? height;
  final double? thickness;
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness ?? 1,
      height: height ?? 16,
      color: color ?? Colors.grey.shade300,
      endIndent: fullWidth != null ? 0 : 37.w,
      indent: fullWidth != null ? 0 : 37.w,
    );
  }
}
