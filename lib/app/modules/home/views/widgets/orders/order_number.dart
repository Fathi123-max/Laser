import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class OrderNumber extends StatelessWidget {
  const OrderNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Order number #226',
        textAlign: TextAlign.center,
        style: MyStyles().languageButtonStyle.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ));
  }
}
