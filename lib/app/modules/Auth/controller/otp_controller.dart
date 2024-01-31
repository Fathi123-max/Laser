import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/core/constants.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/modules/Auth/controller/register_controller.dart';
import 'package:laser/app/routes/app_pages.dart';
import 'package:laser/app/services/base_client.dart';

class OtpController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  // craete a key for loginFormKey
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  RxString otp = ''.obs;

  sendOtp() async {
    if (otpFormKey.currentState!.validate()) {
      await BaseClient.safeApiCall(
        Constants.activateUrl,
        RequestType.post,
        data: {
          "mobile_number":
              "+966${Get.find<RegisterController>().mobileNumber.text}",
          "activation_code": otp.value
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
        } // *) indicate success state
        // update();
        ,

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
