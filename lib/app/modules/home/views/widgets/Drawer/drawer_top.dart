import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';

class DrawerTop extends StatelessWidget {
  const DrawerTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Gap(19),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Scaffold.of(context).closeDrawer();
              },
              child: Icon(
                Icons.close,
                size: 15.w,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            AssetImageView(
              fileName: "logo.png",
              height: 34.h,
              width: 42.w,
            ),
          ],
        ),
      ),
      const Gap(25),
      CustomDivider(
        fullWidth: true,
        color: const Color(0xFFF1F0F5).withOpacity(0.2),
      ),
    ]);
  }
}
