import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/core/constants.dart';
import 'package:laser/app/routes/app_pages.dart';
import 'package:laser/app/services/api_call_status.dart';
import 'package:laser/app/services/base_client.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = true.obs;
  TextEditingController userName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  register() async {
    if (registerFormKey.currentState!.validate()) {
      await BaseClient.safeApiCall(
        Constants.registerUrl,
        RequestType.post,
        data: {
          "username": userName.text,
          "password": password.text,
          "mobile_number": mobileNumber.text
        },
        onLoading: () {
          // *) indicate loading state
          apiCallStatus = ApiCallStatus.loading;
          update();
        },
        onSuccess: (response) {
          // api done successfully
          Get.toNamed(Routes.OtpPage);
          // *) indicate success state
          apiCallStatus = ApiCallStatus.success;
          update();
        },
        // if you don't pass this method base client
        // will automaticly handle error and show message to user
        onError: (error) {
          // show error message to user
          BaseClient.handleApiError(error);
          // *) indicate error status
          apiCallStatus = ApiCallStatus.error;
          update();
        },
      );

      Get.toNamed(Routes.OtpPage);
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
}
