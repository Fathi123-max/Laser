import 'package:get/get.dart';
import 'package:laser/app/core/constants.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/routes/app_pages.dart';
import 'package:laser/app/services/base_client.dart';

class SplashScreenController extends GetxController {
  checkCardintial() async {
    if (MySharedPref.getCurrentToken() != null) {
      await BaseClient.safeApiCall(
        Constants.tokenValidatorUrl,
        RequestType.post,

        headers: {"Authorization": "Bearer ${MySharedPref.getCurrentToken()}"},

        onLoading: () {
          // *) indicate loading state
        },
        onSuccess: (response) {
          // api done successfully
          if (response.data["message"] == "Unauthenticated") {
            Get.toNamed(Routes.LoginPage);
          } else {
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
    } else {
      MySharedPref.getOnBoarding() == "OnBoardingDone"
          ? Get.toNamed(Routes.LoginPage)
          : Get.toNamed(Routes.Onboarding);
    }
  }
}
