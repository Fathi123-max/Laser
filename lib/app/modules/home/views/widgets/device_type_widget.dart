import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/components/custom_image_widget.dart';

class DeviceTypeWidget extends StatelessWidget {
  const DeviceTypeWidget({
    Key? key,
    this.height,
    this.width,
    this.fileName,
    this.text,
    this.onTap,
  }) : super(key: key);
  final double? height;
  final double? width;
  final String? fileName;
  final String? text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 132.w,
        height: height ?? 137.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetImageView(
                fileName: fileName ?? "logo.png", height: 65.h, width: 85.w),
            text == null ? Container() : const Gap(16),
            text == null
                ? Container()
                : Text(
                    text ?? " ",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF1B1926),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.14,
                    ),
                  )
          ],
        ),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x02000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 1,
            )
          ],
        ),
      ),
    );
  }
}
