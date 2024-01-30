import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_text_form_field.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/Auth/controller/register_controller.dart';
import 'package:laser/app/modules/Auth/view/widgets/auth_button.dart';
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
              CustomTextFormField(
                textEditingController: controller.userName,
                hint: "username",
              ),
              const Gap(20),
              CustomTextFormField(
                keyboardType: TextInputType.phone,
                textEditingController: controller.mobileNumber,
                hint: "mobile number",
              ),
              const Gap(20),
              CustomTextFormField(
                hint: "password",
                textEditingController: controller.password,
                isPassword: true,
              ),
              const Gap(20),
              AuthButton(
                data: "Sign up",
                onPressed: () => controller.register(),
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
                    child:
                        Text('Sign in', style: MyStyles().fontSize12WeightBold),
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
