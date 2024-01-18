import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController {
  GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = true.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
}
