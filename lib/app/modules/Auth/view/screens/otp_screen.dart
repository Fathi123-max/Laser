import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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
            OtpTextField(
              numberOfFields: 4,
              fieldWidth: 54.w,
              styles: [
                TextStyle(fontSize: 20.sp),
                TextStyle(fontSize: 20.sp),
                TextStyle(fontSize: 20.sp),
                TextStyle(fontSize: 20.sp),
              ],
              cursorColor: Colors.black,
              borderColor: Colors.black,
              disabledBorderColor: Colors.black,
              enabledBorderColor: Colors.black,
              focusedBorderColor: Colors.black,
              fillColor: Colors.black,
              filled: true,

              obscureText: false,
              borderWidth: 0.2,

              decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                          strokeAlign: 0))),
              autoFocus: true, keyboardType: TextInputType.number,

              hasCustomInputDecoration: true,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },

              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.otp.value = verificationCode;
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         title: const Text("Verification Code"),
                //         content: Text('Code entered is $verificationCode'),
                //       );
                //     });
              }, // end onSubmit
            ),
            const Gap(57),
            AuthButton(
              data: "Send",
              onPressed: () {
                controller.sendOtp();
              },
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
                    Get.toNamed(Routes.NewPassword);
                  },
                  child: Text('Resend', style: MyStyles().fontSize12WeightBold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
