import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactEmail extends StatelessWidget {
  const ContactEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290.w,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text:
                  'If you need to cancel your order you can reach our Customer\n Experience team through the app chat or email at: ',
              style: TextStyle(
                color: const Color(0xFF959595),
                fontSize: 10.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'support@lazer.sa',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
