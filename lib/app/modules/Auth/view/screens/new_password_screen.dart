import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/Auth/controller/new_password_controller.dart';
import 'package:laser/app/modules/Auth/view/widgets/model_layout.dart';

import '../widgets/auth_button.dart';
import '../widgets/custom_text_form_field.dart';

class NewPassword extends GetView<NewPasswordController> {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthModelPage(
      authContant: Form(
        key: controller.newPasswordFormKey,
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
                  '''Your new password should be different
from previously used password''',
                  textAlign: TextAlign.start,
                  style: MyStyles()
                      .authBigTextStyle
                      .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Gap(31),
            const CustomTextFormField(
              key: Key("newPassword"),
              hint: "New Password",
            ),
            const Gap(13),
            const CustomTextFormField(
              key: Key("ConfirmPassword"),
              hint: "Confirm Password",
            ),
            const Gap(25),
            AuthButton(
              data: "Save",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
