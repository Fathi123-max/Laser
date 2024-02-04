import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/data/models/device_type_model.dart';

import '../../../core/constants.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController {
  //page view controller
  Rx<PageController> pageController = Rx(PageController());
  RxBool visibilityOfBanner = true.obs;
  RxBool visibilityOfNextButton = false.obs;
  RxBool visibilityOfBackButton = false.obs;

  // hold data coming from api
  List<dynamic>? deviceTypeList;
  // api call status
  var apiCallStatus = (ApiCallStatus.holding).obs;
  List<bool> dviceTypeWidgetTapped = [false, false, false, false].obs;

  int? storedIndex;

  void deviceTypeTapeFun(int index) {
    storedIndex = index;
    for (int i = 0; i < dviceTypeWidgetTapped.length; i++) {
      dviceTypeWidgetTapped[i] = (i == index);
    }

    pageController.value.nextPage(
        duration: const Duration(milliseconds: 1000), curve: Curves.ease);
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  controllVisibilityOfButtons() {
    pageController.value.addListener(() {
      int currentPage = pageController.value.page?.round() ?? 0;
      // Example: Update UI based on the current page
      visibilityOfBackButton.value = currentPage > 0;

      // Set the visibility of the next button based on the current page
      visibilityOfNextButton.value = currentPage > 0;
    });
  }

  // getting data from api
  getData() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.deviceTypesUrl, // url
      headers: {
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.get, // request type (get,post,delete,put)
      onLoading: () {
        // *) indicate loading state
        apiCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
//resive data in mode datatype model
        deviceTypeList = response.data["payload"]["device_types"]
            .map((e) => DeviceType.fromJson(e as Map<String, dynamic>))
            .toList();

        // print(deviceTypeList!.length);
        // api done successfully
        // data = List.from(response.data);
        // // *) indicate success state
        apiCallStatus.value = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        apiCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

  @override
  void onInit() {
    getData();
    controllVisibilityOfButtons();
    super.onInit();
  }
}
