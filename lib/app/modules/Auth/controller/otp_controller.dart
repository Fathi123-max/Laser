import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  // craete a key for loginFormKey
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
}
