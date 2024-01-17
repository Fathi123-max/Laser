import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/Auth/controller/login_controller.dart';
import 'package:laser/app/modules/Auth/view/widgets/model_layout.dart';

import '../widgets/custom_text_form_field.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthModelPage(
      authContant: Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            Row(
              children: [
                const Gap(53),
                Text(
                  'Register',
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
                  'Please register to log in.',
                  textAlign: TextAlign.center,
                  style: MyStyles()
                      .authBigTextStyle
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Gap(39),
            const CustomTextFormField(
              hint: "username",
            ),
            const Gap(20),
            const CustomTextFormField(
              hint: "mobile number",
            ),
            const Gap(20),
            const CustomTextFormField(
              hint: "password",
              isPassword: true,
            ),
            const Gap(20),
            SizedBox(
              height: 42.h,
              width: 270.w,
              child: ElevatedButton(
                onPressed: () {},
                child: SizedBox(
                  height: 20.h,
                  width: 46.w,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
