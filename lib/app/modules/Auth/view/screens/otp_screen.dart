import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/Auth/controller/otp_controller.dart';
import 'package:laser/app/modules/Auth/view/widgets/model_layout.dart';
import 'package:laser/app/routes/app_pages.dart';

import '../widgets/auth_button.dart';

class OtpPage extends GetView<OtpController> {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthModelPage(
      authContant: Form(
        key: controller.otpFormKey,
        child: Column(
          children: [
            Row(
              children: [
                const Gap(53),
                Text(
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: MyStyles().authBigTextStyle,
                ),
              ],
            ),
            const Gap(6),
            Row(
              children: [
                const Gap(53),
                Text(
                  '''Please Enter the 4 digits number you have
received on your phone number''',
                  textAlign: TextAlign.start,
                  style: MyStyles()
                      .authBigTextStyle
                      .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Gap(39),
            const Gap(59),
            AuthButton(
              data: "Send",
              onPressed: () {},
            ),
            const Gap(13),
            Row(
              children: [
                const Gap(65),
                Text(
                  'Didn’t get a code?  ',
                  style: TextStyle(
                    color: const Color(0xFF1B1926),
                    fontSize: 10.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LoginPage);
                  },
                  child: Text(
                    'Resend',
                    style: TextStyle(
                      color: const Color(0xFF1B1926),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
