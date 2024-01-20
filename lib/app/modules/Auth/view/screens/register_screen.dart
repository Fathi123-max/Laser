import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/Auth/controller/register_controller.dart';
import 'package:laser/app/modules/Auth/view/widgets/auth_button.dart';
import 'package:laser/app/modules/Auth/view/widgets/custom_text_form_field.dart';
import 'package:laser/app/modules/Auth/view/widgets/model_layout.dart';
import 'package:laser/app/routes/app_pages.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Scaffold(
      body: AuthModelPage(
        authContant: Form(
          key: controller.registerFormKey,
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
                key: Key("usernameRigster"),
                hint: "username",
              ),
              const Gap(20),
              const CustomTextFormField(
                hint: "mobile number",
                key: Key("mobileNumber"),
              ),
              const Gap(20),
              const CustomTextFormField(
                hint: "password",
                key: Key("passwordRigster"),
                isPassword: true,
              ),
              const Gap(20),
              AuthButton(
                data: "Sign up",
                onPressed: () {},
              ),
              const Gap(13),
              Row(
                children: [
                  const Gap(65),
                  Text(
                    'Already has an account?  ',
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
      ),
    );
  }
}
