import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/core/constants.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/routes/app_pages.dart';
import 'package:laser/app/services/base_client.dart';

class NewPasswordController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  // craete a key for loginFormKey
  GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newPasswordAgain = TextEditingController();

  setNewPassword() async {
    if (newPasswordFormKey.currentState!.validate()) {
      await BaseClient.safeApiCall(
        Constants.resetPasswordUrl,
        RequestType.post,
        data: {
          "password": newPassword.text,
          "password_confirmation": newPasswordAgain.text
        },
        headers: {"Authorization": "Bearer ${MySharedPref.getCurrentToken()}"},

        onLoading: () {
          // *) indicate loading state
        },
        onSuccess: (response) {
          // api done successfully

          if (response.data["status"]) {
            Get.toNamed(
              Routes.HOME,
            );
          }

          // *) indicate success state
          // update();
        },

        // if you don't pass this method base client
        // will automaticly handle error and show message to user
        onError: (error) {
          // show error message to user

          BaseClient.handleApiError(error);
          // *) indicate error status
          update();
        },
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
}
