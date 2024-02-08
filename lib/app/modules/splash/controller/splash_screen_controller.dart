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

          Get.offAllNamed(Routes.HOME);

          // *) indicate success state
          // update();
        },

        // if you don't pass this method base client
        // will automaticly handle error and show message to user
        onError: (error) {
          // show error message to user
          if (error.statusCode == 401) {
            Get.offAllNamed(Routes.LoginPage);
          }
          // BaseClient.handleApiError(error);
          // *) indicate error status
          // update();
        },
      );
    } else {
      MySharedPref.getOnBoarding() == "OnBoardingDone"
          ? Get.offAllNamed(Routes.LoginPage)
          : Get.offAllNamed(Routes.Onboarding);
    }
  }
}
