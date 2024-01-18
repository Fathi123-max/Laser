import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  // craete a key for loginFormKey
  GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
}
