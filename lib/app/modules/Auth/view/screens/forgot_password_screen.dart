import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/Auth/controller/forget_password_controller.dart';
import 'package:laser/app/modules/Auth/view/widgets/model_layout.dart';
import 'package:laser/app/routes/app_pages.dart';

import '../../../../components/custom_text_form_field.dart';
import '../widgets/auth_button.dart';

class ForgotPage extends GetView<ForgotController> {
  const ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthModelPage(
      authContant: Form(
        key: controller.forgotFormKey,
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
                  '''Please Enter your phone number
to get verification code''',
                  textAlign: TextAlign.start,
                  style: MyStyles()
                      .authBigTextStyle
                      .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Gap(39),
            const CustomTextFormField(
              key: Key("mobile"),
              hint: "Mobile Number",
            ),
            const Gap(59),
            AuthButton(
              data: "Send",
              onPressed: () {
                Get.offNamed(Routes.OtpPage);
              },
            ),
            const Gap(13),
            Row(
              children: [
                const Gap(65),
                Text(
                  'Don’t have an account?  ',
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
                    'Sign in',
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
