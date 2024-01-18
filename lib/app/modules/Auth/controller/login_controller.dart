import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  // craete a key for loginFormKey
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
}
