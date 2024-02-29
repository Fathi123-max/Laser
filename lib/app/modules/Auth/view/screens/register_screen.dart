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
      key: UniqueKey(),
      body: AuthModelPage(
        authContant: Form(
          key: controller.registerFormKey.value,
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
                key: const Key("username"),
                textEditingController: controller.userName,
                hint: "username",
              ),
              const Gap(20),
              CustomTextFormField(
                key: const Key("mobileNumber2"),
                keyboardType: TextInputType.phone,
                textEditingController: controller.mobileNumber,
                hint: "mobile number",
              ),
              const Gap(20),
              CustomTextFormField(
                key: const Key("password2"),
                hint: "password",
                isRigter: true,
                textEditingController: controller.password,
                isPassword: true,
              ),
              const Gap(20),
              AuthButton(
                data: "Sign up",
                onPressed: () {
                  controller.register();
                  FocusScope.of(context).unfocus();
                },
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
                      // Get.offNamed(Routes.LoginPage);
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.LoginPage, (r) => false);
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
