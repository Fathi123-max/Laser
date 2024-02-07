import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:get/get.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/data/models/device_brand_model.dart';
import 'package:laser/app/data/models/device_model.dart';
import 'package:laser/app/data/models/device_type_model.dart';

import '../../../core/constants.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController {
  Rx<PageController> pageController = Rx(PageController());
  RxBool visibilityOfBanner = true.obs;
  RxBool visibilityOfNextButton = false.obs;
  RxBool visibilityOfBackButton = false.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic>? deviceTypeList;
  List<dynamic>? deviceBrandList;
  RxList<DeviceModel> deviceModelList = RxList([]);
  RxList<dynamic> deviceColorList = RxList([]);
  var deviceModelVisibleController = false.obs;
  var deviceColorVisibleController = false.obs;
  var apiDeviceTypesCallStatus = (ApiCallStatus.holding).obs;
  var apiDeviceBrandsCallStatus = (ApiCallStatus.holding).obs;
  var apiDeviceModelCallStatus = (ApiCallStatus.holding).obs;
  List<bool> dviceTypeWidgetTapped = [false, false, false, false].obs;
  List<RxBool> dviceBrandWidgetTapped = [
    false.obs,
  ].obs;
  int? dviceTypeIndex;
  int? dviceBrandIndex;
  var expandedDeviceModelTileController =
      ExpandedTileController(isExpanded: false);

// controll tapping of device and visibilty of buttons ***************************************************************
  void controlleDeviceTypeTap(
    int index,
  ) {
    dviceTypeIndex = index;

    for (int i = 0; i < deviceTypeList!.length; i++) {
      dviceTypeWidgetTapped[i] = (i == index);
    }

// get device brands
    getDeviceBrand();

// navgate to Brand page
    pageController.value.nextPage(
        duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
    update();
  }

  void controlleDeviceBrandTap(
    int index,
  ) {
    dviceBrandIndex = index;

    for (int i = 0; i < dviceBrandWidgetTapped.length; i++) {
      dviceBrandWidgetTapped[i].value = (i == index);
    }

// get device Models
    getModels((deviceBrandList![index] as DeviceBrandModel).id!);
// navgate to Brand page
  }

  controllVisibilityOfButtons() {
    pageController.value.addListener(() {
      int currentPage = pageController.value.page?.round() ?? 0;
      // Example: Update UI based on the current page
      visibilityOfBackButton.value = currentPage > 0;

      // Set the visibility of the next button based on the current page
      visibilityOfNextButton.value = currentPage > 500;
    });
  }

  void deviceModelClicked({required int index}) {
    deviceColorVisibleController.value = true;
    // setActiveModelIndex(index);

    deviceColorList.value =
        RxList<dynamic>.from(deviceModelList[index].colors as List<dynamic>);
    update();
    deviceColorList.refresh();
  }

  void deviceColoeClicked({required int index}) {
    // save device color and device type in shared pref
    MySharedPref.saveDeviceColor(deviceColorList[index].toString());
    MySharedPref.saveDeviceType(
        deviceModelList[activeModelIndex.value].name.toString());
    MySharedPref.saveDeviceId(
        deviceModelList[activeModelIndex.value].id.toString());

    // hide model and color
    deviceModelVisibleController.value = true;
    deviceColorVisibleController.value = true;
    update();

    // navgate to Service page
    pageController.value.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void backButtonLogic() {
    pageController.value.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    deviceModelVisibleController.value = false;
    deviceColorVisibleController.value = false;
    update();
  }

  var activeModelIndex = (-1).obs; // Start with no active model
  var activeColorModelIndex = (-1).obs; // Start with no active model

  // Call this method when an item is tapped
  void setActiveModelIndex(int index) {
    activeModelIndex.value = index;
    // Add any other logic necessary when an item becomes active

    deviceModelClicked(index: index);
    update(); // Call this if you're using GetX and you need to update the UI
  }

  // Call this method when an item is tapped
  void setActiveColorModelIndex(int index) {
    activeColorModelIndex.value = index;
    // Add any other logic necessary when an item becomes active

    deviceColoeClicked(
      index: index,
    );
    update(); // Call this if you're using GetX and you need to update the UI
  }

//? http methods for api  ****************************************************************************************
  getDeviceTypes() async {
    await BaseClient.safeApiCall(
      Constants.deviceTypesUrl,
      headers: {
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.get,
      onLoading: () {
        apiDeviceTypesCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        deviceTypeList = response.data["payload"]["device_types"]
            .map((e) => DeviceType.fromJson(e as Map<String, dynamic>))
            .toList();

        apiDeviceTypesCallStatus.value = ApiCallStatus.success;
        update();
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        apiDeviceTypesCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

  getDeviceBrand() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      "${Constants.deviceBrandsUrl}/${dviceTypeIndex! + 1}",
      headers: {
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.get,
      onLoading: () {
        // *) indicate loading state
        apiDeviceBrandsCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        deviceBrandList = response.data["payload"]["device_brands"]
            .map((e) => DeviceBrandModel.fromJson(e as Map<String, dynamic>))
            .toList();
        dviceBrandWidgetTapped =
            deviceBrandList?.map((_) => false.obs).toList() ?? [];

        apiDeviceBrandsCallStatus.value = ApiCallStatus.success;
        update();
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        apiDeviceBrandsCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

  getModels(int dviceModelId) async {
    // *) perform api call
    await BaseClient.safeApiCall(
      "${Constants.modelsUrl}/$dviceModelId",
      headers: {
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.get,
      onLoading: () {
        // *) indicate loading state
        apiDeviceModelCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        deviceModelList = RxList<DeviceModel>.from(response.data["payload"]
                ["device_models"]
            .map((e) => DeviceModel.fromJson(e as Map<String, dynamic>))
            .toList());

        apiDeviceModelCallStatus.value = ApiCallStatus.success;
        deviceModelVisibleController.value = true;
        update();
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        apiDeviceModelCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

//? initialization block ******************************************************************************************
  @override
  void onInit() {
    getDeviceTypes();
    controllVisibilityOfButtons();
    super.onInit();
  }

// Helpers
  Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
