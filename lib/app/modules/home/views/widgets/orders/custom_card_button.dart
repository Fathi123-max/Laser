import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class CustomCardButton extends StatelessWidget {
  const CustomCardButton({
    Key? key,
    this.onTap,
    this.text,
    this.color,
    this.width,
    this.heaight,
    this.colorText,
    this.fontsize,
    this.bold,
  }) : super(key: key);
//ontap
  final Function()? onTap;
  final String? text;
  final Color? color;
  final Color? colorText;

  final double? width;
  final double? heaight;
  final double? fontsize;
  final bool? bold;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 96.w,
        height: heaight ?? 22.h,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(text ?? "Details",
            style: MyStyles().languageButtonStyle.copyWith(
                  color: colorText,
                  fontSize: fontsize ?? 10.sp,
                  fontWeight: bold != null ? FontWeight.bold : FontWeight.w400,
                )),
      ),
    );
  }
}
