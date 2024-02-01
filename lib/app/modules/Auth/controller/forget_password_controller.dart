import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/core/constants.dart';
import 'package:laser/app/routes/app_pages.dart';
import 'package:laser/app/services/base_client.dart';

class ForgotController extends GetxController {
  GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = true.obs;
  TextEditingController mobileNumber = TextEditingController();
  getNewPassword() async {
    if (forgotFormKey.currentState!.validate()) {
      await BaseClient.safeApiCall(
        Constants.forgetPasswordUrl,
        RequestType.post,
        data: {"mobile_number": mobileNumber.text},

        onLoading: () {
          // *) indicate loading state
        },
        onSuccess: (response) {
          // api done successfully

          if (response.data["status"]) {
            Get.toNamed(Routes.OtpPage,
                parameters: {"forgot password": "true"});
          } else {}
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
