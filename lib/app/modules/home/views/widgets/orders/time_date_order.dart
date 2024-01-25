import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class TimeDateOrder extends StatelessWidget {
  const TimeDateOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Wednesday, 9 Dec 2024\n11:00 - 12:00 PM',
        textAlign: TextAlign.center,
        style: MyStyles().languageButtonStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ));
  }
}
