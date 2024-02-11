import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/components/custom_image_widget.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.onTap,
    this.iconPath,
    this.text,
  });
  final Function()? onTap;
  final String? iconPath;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
      title: SizedBox(
        width: 430.w,
        child: Row(children: [
          AssetImageView(fileName: iconPath ?? "history.png"),
          const Gap(17),
          Text(text ?? "Activity History",
              style: TextStyle(
                color: const Color(0xFFF1F0F5),
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ))
        ]),
      ),
    );
  }
}
