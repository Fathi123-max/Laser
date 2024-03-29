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
  LoginPage({super.key});
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthModelPage(
      authContant: Form(
        canPop: false,
        key: loginFormKey,
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
            CustomTextFormField(
              textEditingController: controller.mobileNumber,
              key: const Key("mobileNumber"),
              hint: "phonenumber",
            ),
            const Gap(20),
            CustomTextFormField(
              textEditingController: controller.password,
              hint: "password",
              key: const Key("password"),
              isPassword: true,
            ),
            const Gap(20),
            AuthButton(
              data: "Login",
              onPressed: () {
                controller.login(loginFormKey);
                FocusScope.of(context).unfocus();
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
                    // Get.offNamed(Routes.RegisterPage);
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.RegisterPage, (r) => false);
                    FocusScope.of(context).unfocus();
                  },
                  child:
                      Text('Sign up', style: MyStyles().fontSize12WeightBold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
