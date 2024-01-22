import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/Auth/controller/login_controller.dart';
import 'package:laser/app/modules/Auth/view/widgets/model_layout.dart';
import 'package:laser/app/routes/app_pages.dart';

import '../../../../components/custom_text_form_field.dart';
import '../widgets/auth_button.dart';

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
                  'Login',
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
                  'Please login to log in.',
                  textAlign: TextAlign.center,
                  style: MyStyles()
                      .authBigTextStyle
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Gap(39),
            const CustomTextFormField(
              key: Key("username"),
              hint: "username",
            ),
            const Gap(20),
            const CustomTextFormField(
              key: Key("password"),
              hint: "password",
              isPassword: true,
              isLogin: true,
            ),
            const Gap(20),
            AuthButton(
              data: "Login",
              onPressed: () {},
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
                    Get.toNamed(Routes.RegisterPage);
                  },
                  child: Text(
                    'Sign up',
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
