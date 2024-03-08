import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/core/constants.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/routes/app_pages.dart';
import 'package:laser/app/services/base_client.dart';

class LoginController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  // craete a key for loginFormKey

  TextEditingController mobileNumber = TextEditingController(text: "966");
  TextEditingController password = TextEditingController();

  login([loginFormKey]) async {
    if (loginFormKey.currentState!.validate()) {
      await BaseClient.safeApiCall(
        Constants.loginUrl,
        RequestType.post,
        data: {
          "mobile_number": mobileNumber.text,
          "password": password.text,
        },

        onLoading: () {
          // *) indicate loading state
        },
        onSuccess: (response) {
          // api done successfully
          if (response.data["status"]) {
            MySharedPref.setCurrentToken(response.data["payload"]["token"]);
            Get.toNamed(Routes.HOME);
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
