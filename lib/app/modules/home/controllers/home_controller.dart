import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController {
  //page view controller
  Rx<PageController> pageController = Rx(PageController());
  RxBool visibilityOfBanner = true.obs;
  RxBool visibilityOfNextButton = true.obs;
  RxBool visibilityOfBackButton = false.obs;

  // hold data coming from api
  List<dynamic>? data;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  controllVisibilityOfButtons(bool skipCondition) {
    pageController.value.addListener(() {
      int currentPage = pageController.value.page?.round() ?? 0;
      // Example: Update UI based on the current page
      visibilityOfBackButton.value = currentPage > 0;

      // Set the visibility of the next button based on the current page
      visibilityOfNextButton.value = currentPage < 3;
    });
  }

  // getting data from api
  getData() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.deviceTypesUrl, // url
      RequestType.get, // request type (get,post,delete,put)
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully
        data = List.from(response.data);
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
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    pageController.value.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  @override
  void onInit() {
    // getData();
    super.onInit();
  }
}
