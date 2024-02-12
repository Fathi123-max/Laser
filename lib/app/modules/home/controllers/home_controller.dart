import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/data/models/device_brand_model.dart';
import 'package:laser/app/data/models/device_model.dart';
import 'package:laser/app/data/models/device_type_model.dart';
import 'package:laser/app/data/models/service_model.dart';
import 'package:laser/app/routes/app_pages.dart';

import '../../../core/constants.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController {
  Rx<PageController> pageController = Rx(PageController());
  RxBool visibilityOfBanner = true.obs;
  RxBool visibilityOfNextButton = false.obs;
  RxBool visibilityOfBackButton = false.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxList<DeviceType> deviceTypeList = RxList([]);
  RxList<DeviceBrandModel> deviceBrandList = RxList([]);
  RxList<DeviceModel> deviceModelList = RxList([]);
  RxList<ServiceModel> serviceList = RxList([]);
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
      ExpandedTileController(isExpanded: true).obs;

  var activeModelIndex = (-1).obs; // Start with no active model
  var activeColorModelIndex = (-1).obs; // Start with no active model
  var activeServiceModelIndex = (-1).obs; // Start with no active model

  ScrollController brandScrollController = ScrollController();
  ScrollController serviceScrollController = ScrollController();

// controll tapping of device and visibilty of buttons ***************************************************************
  void controlleDeviceTypeTap(
    int index,
  ) {
    dviceTypeIndex = index;

    for (int i = 0; i < deviceTypeList!.length; i++) {
      dviceTypeWidgetTapped[i] = (i == index);
    }

// get device brands
    getDeviceBrand(lang: LocalizationService.isItEnglish() ? "en" : "ar");

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
    getModels((deviceBrandList![index]).id!,
        lang: LocalizationService.isItEnglish() ? "en" : "ar");
// navgate to Brand page
  }

  Future<void> deviceModelClicked({required int index}) {
    deviceColorVisibleController.value = true;
    // setActiveModelIndex(index);

    deviceColorList.value =
        RxList<dynamic>.from(deviceModelList[index].colors as List<dynamic>);
    MySharedPref.saveDeviceId(
        deviceModelList[activeModelIndex.value].id.toString());

    getService(
      MySharedPref.getDeviceId() ?? "",
      lang: LocalizationService.isItEnglish() ? "en" : "ar",
    );
    update();
    deviceColorList.refresh();
    return Future.value();
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

  void setActiveServicesIndex(int index) {
    activeServiceModelIndex.value = index;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scroll(isBrand: false);
    });

    MySharedPref.saveService(serviceList[index].serviceId.toString());
    update();
  }

  void setActiveModelIndex(int index) {
    activeModelIndex.value = index;

    deviceModelClicked(index: index).then((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scroll(isBrand: true);
      });
    });
    update();
  }

  void deviceColoeClicked({required int index}) {
    // save device color and device type in shared pref
    MySharedPref.saveDeviceColor(deviceColorList[index].toString());
    MySharedPref.saveDeviceType(
        deviceModelList[activeModelIndex.value].name.toString());

    // hide model and color
    deviceModelVisibleController.value = true;
    deviceColorVisibleController.value = true;

    // navgate to Service page
    pageController.value.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

//? http methods for api  ****************************************************************************************
  getDeviceTypes({String? lang = ""}) async {
    await BaseClient.safeApiCall(
      Constants.deviceTypesUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.get,
      onLoading: () {
        apiDeviceTypesCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        apiDeviceTypesCallStatus.value = ApiCallStatus.success;

        deviceTypeList = RxList<DeviceType>.from(response.data["payload"]
                ["device_types"]
            .map((e) => DeviceType.fromJson(e as Map<String, dynamic>))
            .toList());

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

  getDeviceBrand({String? lang = ""}) async {
    // *) perform api call
    await BaseClient.safeApiCall(
      "${Constants.deviceBrandsUrl}/${dviceTypeIndex! + 1}",
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.get,
      onLoading: () {
        // *) indicate loading state
        apiDeviceBrandsCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        deviceBrandList = RxList<DeviceBrandModel>.from(response.data["payload"]
                ["device_brands"]
            .map((e) => DeviceBrandModel.fromJson(e as Map<String, dynamic>))
            .toList());
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

  getModels(int brandId, {String? lang = ""}) async {
    // *) perform api call
    await BaseClient.safeApiCall(
      "${Constants.modelsUrl}/$brandId",
      headers: {
        "Accept-Language": lang,
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

  getService(String dviceModelId, {String? lang = ""}) async {
    // *) perform api call
    await BaseClient.safeApiCall(
      "${Constants.getServicesUrl}/$dviceModelId",
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.get,
      onLoading: () {
        // *) indicate loading state

        apiDeviceModelCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        serviceList = RxList<ServiceModel>.from(response.data["payload"]
                ["device_services"]
            .map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
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
    getDeviceTypes(lang: LocalizationService.isItEnglish() ? "en" : "ar");

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

  onPopInvoked() {
    pageController.value.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void backButtonLogic() {
    pageController.value.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    if (pageController.value.page == 1) {
      deviceModelVisibleController.value = false;
      deviceColorVisibleController.value = false;
    } else {}
    update();
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

  void changLang() {
    LocalizationService.updateLanguage(
            !LocalizationService.isItEnglish() ? "en" : "ar")
        .then((_) async {
      getDeviceTypes(lang: LocalizationService.isItEnglish() ? "en" : "ar");
      pageController.value.animateToPage(0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      deviceBrandList.clear();
      deviceTypeList.clear();
      deviceModelList.clear();
      deviceModelVisibleController.value = false;
      deviceColorVisibleController.value = false;
    });
  }

  void scroll({bool? isBrand = false}) {
    isBrand!
        ? brandScrollController.animateTo(
            brandScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
        : serviceScrollController.animateTo(
            serviceScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
  }

  signout() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.logoutUrl, // url
      RequestType.get, // request type (get,post,delete,put)
      onLoading: () {
        // *) indicate loading state
      },
      onSuccess: (response) {
        // *) indicate success state
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user

        if (error.statusCode == 401) {
          Get.offAllNamed(Routes.LoginPage);
        }
        MySharedPref.clear();
        // BaseClient.handleApiError(error);
      },
    );
  }
}
