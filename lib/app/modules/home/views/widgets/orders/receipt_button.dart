import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class ReceiptButton extends StatelessWidget {
  const ReceiptButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 131.w,
      height: 27.h,
      alignment: Alignment.center,
      child: Text('View receipt',
          textAlign: TextAlign.center,
          style: MyStyles().fontSize12Weight400.copyWith(
                color: Colors.white,
              )),
      decoration: ShapeDecoration(
        color: const Color(0xFF1B1D28),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
