import 'package:get/get.dart';
import 'package:laser/app/core/constants.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/services/base_client.dart';

class WalletController extends GetxController {
  RxString? balance = RxString("0.0");

  Future<void> getBalance({String? lang}) async {
    await BaseClient.safeApiCall(
      Constants.getwalletdetailsurl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.get,
      onLoading: () {
        // apiDeviceTypesCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // apiDeviceTypesCallStatus.value = ApiCallStatus.success;
        print(response.data["payload"]["availableBalance"]);
        balance!.value = response.data["payload"]["availableBalance"];
      },
      onError: (error) {
        BaseClient.handleApiError(error);

        // *) indicate error status
        // apiDeviceTypesCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
    return Future(() => true);
  }
}
