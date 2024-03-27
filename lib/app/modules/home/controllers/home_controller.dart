import 'dart:async';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_snackbar.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/data/models/device_brand_model.dart';
import 'package:laser/app/data/models/device_model.dart';
import 'package:laser/app/data/models/device_type_model.dart'
    as device_type_model;
import 'package:laser/app/data/models/order_details_model.dart';
import 'package:laser/app/data/models/order_model.dart';
import 'package:laser/app/data/models/payment_details_model.dart';
import 'package:laser/app/data/models/resepmodel.dart';
import 'package:laser/app/data/models/service_model.dart';
import 'package:laser/app/modules/home/controllers/controller_helper/location_services.dart';
import 'package:laser/app/modules/home/controllers/controller_helper/pick_controller.dart';
import 'package:laser/app/routes/app_pages.dart';

import '../../../core/constants.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController with GetxServiceMixin {
  Rx<PageController> pageController = Rx(PageController());
  RxBool visibilityOfBanner = true.obs;
  RxBool visibilityOfNextButton = false.obs;
  RxBool visibilityOfBackButton = false.obs;

  RxList<device_type_model.DeviceType> deviceTypeList = RxList([]);
  RxList<OrderModel> orderList = RxList([]);
  OrderDetailsModel orderDetailsModel = OrderDetailsModel();
  Respmodel reModel = Respmodel();
  RxList<DeviceBrandModel> deviceBrandList = RxList([]);
  RxList<DeviceModel> deviceModelList = RxList([]);
  RxList<ServiceModel> serviceList = RxList([]);
  RxList<String> selectedServiceList = RxList([]);
  var selectedItems = <int>{}.obs;
  RxList<dynamic> hoursList = RxList([]);
  RxList<dynamic> deviceColorList = RxList([]);
  var deviceModelVisibleController = false.obs;
  var deviceColorVisibleController = false.obs;
  var apiDeviceTypesCallStatus = (ApiCallStatus.holding).obs;
  var apiDeviceBrandsCallStatus = (ApiCallStatus.holding).obs;
  var apiDeviceModelCallStatus = (ApiCallStatus.holding).obs;
  var apiWorkingHoursCallStatus = (ApiCallStatus.holding).obs;
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
  var activeHoureIndex = (-1).obs; // Start with no active model

  ScrollController brandScrollController = ScrollController();
  ScrollController serviceScrollController = ScrollController();
  ScrollController hoursScrollController = ScrollController();

  RxString chosenDate = RxString("");
  RxString chosenHours = RxString("");

  TextEditingController addressController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  RxList<dio.MultipartFile> pickedImages = <dio.MultipartFile>[].obs;
  RxList<dio.MultipartFile> pickedVideos = <dio.MultipartFile>[].obs;

  ScrollController scrollOrderController = ScrollController();

  RxBool detailskey = RxBool(true);

  RxString numberOfServices = RxString("");

  TextEditingController discountController = TextEditingController();

  RxBool paywithCard = RxBool(false);

// controll tapping of device and visibilty of buttons ***************************************************************
  void controlleDeviceTypeTap(
    int index,
  ) {
    dviceTypeIndex = index;
    MySharedPref.saveDeviceType("${index + 1}");
    for (int i = 0; i < deviceTypeList!.length; i++) {
      dviceTypeWidgetTapped[i] = (i == index);
    }

// get device brands
    getDeviceBrand(lang: LocalizationService.isItEnglish() ? "en" : "ar");

// navgate to Brand page
    pageController.value.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    update();
  }

  var dateTime = DateTime.now().obs;
  controlleDate(DateTime date) {
    String desiredOutput = date.toString().substring(0, 10);
    dateTime.value = date;
    chosenDate.value = desiredOutput;
    getWorkingHours(
        lang: LocalizationService.isItEnglish() ? "en" : "ar",
        date: chosenDate.value);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scroll(isHours: true);
    });
  }

  void controlleDeviceBrandTap(
    int index,
  ) {
    dviceBrandIndex = index;

    for (int i = 0; i < dviceBrandWidgetTapped.length; i++) {
      dviceBrandWidgetTapped[i].value = (i == index);
    }

// get device Models
    getModels((deviceBrandList.value![index]).id!,
        lang: LocalizationService.isItEnglish() ? "en" : "ar");
    MySharedPref.savedeviceBrand("${(deviceBrandList.value![index]).id!}");
    deviceColorVisibleController.value = false;
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

    deviceColorClicked(
      index: index,
    );
    update(); // Call this if you're using GetX and you need to update the UI
  }

  void toggleSelection(int index) {
    if (selectedItems.contains(index)) {
      selectedServiceList.remove(serviceList[index].serviceId.toString());
      selectedItems.remove(index);
    } else {
      selectedItems.add(index);
      selectedServiceList.add(serviceList[index].serviceId.toString());
    }
    update(); // Triggers a UI update
  }

  RxBool isSelected(int index) {
    return selectedItems.contains(index).obs;
  }

  // void toggleSelection(
  //   int index,f
  // ) {
  //   serviceListBool[index].value =
  //       !serviceListBool[index].value; // Corrected toggle
  //   activeServiceModelIndex.value = index;
  //   serviceListBool.refresh();
  // }

  // serviceListBool.refresh();

  // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   scroll(isService: true);
  // });

  void setHoursIndex(int index) {
    activeHoureIndex.value = index;

    chosenHours.value = hoursList[activeHoureIndex.value];
    // update();
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

  void deviceColorClicked({required int index}) {
    // save device color and device type in shared pref
    MySharedPref.saveDeviceColor(
        deviceColorList[index]['color_name'].toString());
    MySharedPref.saveDeviceModelType(
        deviceModelList[activeModelIndex.value].id.toString());

    // hide model and color
    // deviceModelVisibleController.value = true;
    // deviceColorVisibleController.value = true;
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

        deviceTypeList = RxList<device_type_model.DeviceType>.from(response
            .data["payload"]["device_types"]
            .map((e) => device_type_model.DeviceType.fromJson(
                e as Map<String, dynamic>))
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
      Constants.modelsUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      queryParameters: {
        "device_brand": brandId,
        "device_type": dviceTypeIndex! + 1
      },
      RequestType.post,
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

        // apiDeviceModelCallStatus.value = ApiCallStatus.loading;
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
        // apiDeviceModelCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

  getWorkingHours({String? lang, String? date}) async {
    dio.FormData dateFormData = dio.FormData.fromMap({"date": date});
    await BaseClient.safeApiCall(
      Constants.getworkingtimeUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      data: dateFormData,
      onLoading: () {
        apiWorkingHoursCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        hoursList.value = RxList<dynamic>.from(
            response.data["payload"]["working_times"].map((e) => e));

        apiWorkingHoursCallStatus.value = ApiCallStatus.success;
        // deviceModelVisibleController.value = true;
        update();
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        apiWorkingHoursCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

  createOrder({String? lang}) async {
    List<String> services = MySharedPref.getServiceIds()!;
    dio.FormData orderFormData = dio.FormData.fromMap(
      {
        "device_type": MySharedPref.getDeviceType(),
        "device_brand": MySharedPref.getDeviceBrand(),
        "device_model": MySharedPref.getDeviceModelType(),
        "device_color_name": MySharedPref.getDeviceColor(),
        "problem_info": noteController.text,
        "address": addressController.text,
        "arrival_date": chosenDate.value,
        "arrival_time": chosenHours.value,
        'payment_type': "1",
        "device_services[]": services,
        "images[]": Get.find<PickController>().pickedImages,
        "videos[]": Get.find<PickController>().pickedVideos
      },
    );

    await BaseClient.safeApiCall(
      Constants.createMaintenanceOrderUrl,
      headers: {
        "Content-Type": "application/json",
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      data: orderFormData,
      onSuccess: (response) {
        getAllOrders(
                lang: LocalizationService.isItEnglish() ? "en" : "ar", index: 0)
            .then((value) => isOrderSelected.value = false)
            .then((value) => pageController.value
                    .nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                )
                    .then((value) {
                  Get.find<HomeController>().visibilityOfBanner.value = false;
                }));
        MySharedPref.saveOrderId(
            response.data["payload"]["order_id"].toString());
        Get.find<PickController>().pickedImages.clear();
        Get.find<PickController>().pickedVideos.clear();
      },
      onError: (error) {
        BaseClient.handleApiError(error);
        update();
      },
    );
  }

  Future<void> getAllOrders({String? lang, int? index}) async {
    await BaseClient.safeApiCall(
      Constants.getAllMaintenanceOrderUrl(index ?? 0),
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

        // If this is not the first page, append the new orders to the existing list.
        if (index != null && index > 1) {
          var newOrders = RxList<OrderModel>.from(response.data["payload"]
                  ["data"]
              .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
              .toList());

          // Add the new orders to the existing list.
          orderList.addAll(newOrders);
        } else {
          // If this is the first page, replace the existing list with the new orders.
          orderList = RxList<OrderModel>.from(response.data["payload"]["data"]
              .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
              .toList());
        }

        orderList.refresh();
        print(orderList.value.first.orderId);
      },
      onError: (error) {
        if (error.response!.data["error"] == true) {
          CustomSnackBar.showCustomSnackBar(
            title: "End Of Orders",
            message: "No More Orders",
          );
        } else {
          BaseClient.handleApiError(error);
        }

        // *) indicate error status
        apiDeviceTypesCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
    return Future(() => true);
  }

  rescheduleOrder({
    String? lang = "",
    String? orderId,
  }) async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.rescheduleOrderUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      queryParameters: {
        "order_id": orderId,
        "arrival_date": chosenDate.value,
        "arrival_time": chosenHours.value
      },
      // data: {"order_id", orderId},
      onLoading: () {
        // *) indicate loading state
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // *) indicate success
        // orderList.removeWhere((element) => element.orderId == orderId);
        orderList.refresh();

        update();
        Get.back();
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

  cancelOrder({String? lang = "", int? orderId}) async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.cancelOrderUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      queryParameters: {"order_id": orderId},
      // data: {"order_id", orderId},
      onLoading: () {
        // *) indicate loading state
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // *) indicate success
        orderList.removeWhere((element) => element.orderId == orderId);
        orderList.refresh();

        update();
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

  RxInt orderindex = RxInt(0);

  Future<void> orderDetails(
      {String? lang = "", int? orderId, int? index}) async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.orderDetailsUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      queryParameters: {"order_id": orderId},
      // data: {"order_id", orderId},
      onLoading: () {
        // *) indicate loading state
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // *) indicate success
        detailskey.value = false;
        isOrderSelected.value = true;
        orderDetailsModel = OrderDetailsModel.fromJson(
          response.data["payload"]["data"] as Map<String, dynamic>,
        );

        update();
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

  Future<void> paymentReceipt(
      {String? lang = "", int? orderId, int? index}) async {
    print(orderDetailsModel.totalPrice);
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.paymentreceiptUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      // queryParameters: {"order_id": orderId},
      queryParameters: {"order_id": orderId},
      onLoading: () {
        update();
      },
      onSuccess: (response) {
        reModel = Respmodel.fromJson(
            response.data["payload"]["data"] as Map<String, dynamic>);
/**{
I/flutter ( 4077): ║                 orderId: 175,
I/flutter ( 4077): ║                 date: "2024-03-26",
I/flutter ( 4077): ║                 time: "11:00 : 12:00",
I/flutter ( 4077): ║                 serviceDetails: [{name: IPHONE METAL BACK COVER - 11 PRO -Green, price: 50}, {name: Checking, price: 50}]
I/flutter ( 4077): ║                 discount: 0,
I/flutter ( 4077): ║                 finalPrice: 100
I/flutter ( 4077): ║            }
 */
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

  PaymentDetails? paymentDetailsModel = PaymentDetails();
  Future<void> paymentScreenDetailsUrl(
      {String? lang = "", int? orderId}) async {
    print(orderDetailsModel.totalPrice);
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.paymentScreenDetailsUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      queryParameters: {"order_id": orderId},

      // queryParameters: {"order_id": orderId},
      onLoading: () {
        update();
      },
      onSuccess: (response) {
        // numberOfServices.value =
        //     response.data["payload"]["data"]["numberOfServices"];
        paymentDetailsModel = PaymentDetails.fromJson(
          response.data["payload"]["data"] as Map<String, dynamic>,
        );
        update();
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

  RxInt priceAfetrSucsses = RxInt(0);
  RxString serviceDetails = RxString("");
  RxString techComments = RxString("");
  RxString paymentType = RxString("");
  RxString address = RxString("");

  Future<void> paymentSuccess(
      {String? lang = "", int? orderId, int? index}) async {
    print(orderDetailsModel.totalPrice);
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.paymentSuccessUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      queryParameters: {"order_id": orderId},

      // queryParameters: {"order_id": orderId},
      onLoading: () {
        update();
      },
      onSuccess: (response) {
        /**  "orderId": 16,
            "serviceDetails": "IPHONE BATTERY - IP 6S (ADC - EONE - 5130/06) - 52 SAR \n LCD IPHONE 11 2 - 81 SAR",
            "paymentType": "Card",
            "price": 133,
            "address": "65HG+22J,65HG+22J - The World Islands - Dubai - United Arab Emirates,United Arab Emirates",
            "techComments": null */

        techComments.value = response.data["payload"]["data"]["techComments"];
        paymentType.value = response.data["payload"]["data"]["paymentType"];
        address.value = response.data["payload"]["data"]["address"];
        serviceDetails.value =
            response.data["payload"]["data"]["serviceDetails"];
        priceAfetrSucsses.value = response.data["payload"]["data"]["price"];
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.error;
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
    if (pageController.value.page == 4.0) {
      pageController.value.jumpToPage(0);
      detailskey.value = true;
      return false;
    }
    if (pageController.value.page == 1.0) {
      pageController.value.jumpToPage(0);
      deviceModelVisibleController.value = false;
      deviceColorVisibleController.value = false;
      return false;
    }

    pageController.value.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    detailskey.value = true;
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
      // visibilityOfBackButton.value = currentPage > 0 && currentPage < 2;
      visibilityOfBackButton.value = false;

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

  void scroll(
      {bool? isBrand = false, bool? isService = false, bool? isHours = false}) {
    isBrand!
        ? brandScrollController.animateTo(
            brandScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
        : null;

    isService!
        ? serviceScrollController.animateTo(
            serviceScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
        : null;

    isHours!
        ? hoursScrollController.animateTo(
            hoursScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
        : null;
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

  Future<void> supmitService() async {
    addressController.text =
        await Get.put(LocationController()).getCurrentLocationAddress();
    // addressController.text = "hello";
    // await Get.put(LocationController()).getCurrentLocationAddress();

    MySharedPref.saveService(selectedServiceList.value);

    return pageController.value.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  RxBool isOrderSelected = RxBool(true);
  toOrderList(context) {
    isOrderSelected.value == true
        ? getAllOrders(lang: LocalizationService.isItEnglish() ? "en" : "ar")
            .then((value) => Get.toNamed(Routes.ORDER_LIST))
        : backfun(context);
    isOrderSelected.toggle();
    // Get.to(() => ,
    //     transition: Transition.cupertino));
  }

  backfun(context) {
    if (pageController.value.page == 4.0) {
      pageController.value.animateToPage(0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      deviceBrandList.clear();
      // deviceTypeList.clear();
      deviceModelList.clear();
      deviceModelVisibleController.value = false;
      deviceColorVisibleController.value = false;
    } else {
      // Navigator.pushNamedAndRemoveUntil(context, Routes.HOME, (r) => false);
      Get.offAllNamed(Routes.HOME);
    }
  }

  onPopInvokedOrders(context) {
    // Navigator.pushNamedAndRemoveUntil(context, Routes.HOME, (r) => false);
    Get.offNamed(Routes.HOME);
    // Get.to(() => const HomeView());
  }
}
