import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class BackBut extends StatelessWidget {
  const BackBut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text('Back',
          textAlign: TextAlign.center,
          style: MyStyles()
              .languageButtonStyle
              .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w700)),
    );
  }
}
