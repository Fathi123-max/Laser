import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/core/constants.dart';
import 'package:laser/app/data/models/payload.dart';
import 'package:laser/app/data/models/register_response.dart';
import 'package:laser/app/data/models/user.dart';
import 'package:laser/app/routes/app_pages.dart';
import 'package:laser/app/services/base_client.dart';

class RegisterController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  TextEditingController userName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController(text: "966");
  TextEditingController password = TextEditingController();
  var registerResponse = RegisterResponse().obs;
  var user = User().obs;
  register([GlobalKey<FormState>? registerFormKey]) async {
    if (registerFormKey!.currentState!.validate()) {
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
        },
        onSuccess: (response) {
          // api done successfully
          registerResponse.value = RegisterResponse.fromData(
            status: response.data["status"],
            error: response.data["error"],
            err_message: response.data["err_message"],
            payload: Payload.fromJson(response.data["payload"]),
          );
          if (registerResponse.value.status == true) {
            user.value = registerResponse.value.payload!.user!;
            Get.toNamed(Routes.OtpPage);
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
