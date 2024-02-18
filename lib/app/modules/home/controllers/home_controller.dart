import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/data/models/device_brand_model.dart';
import 'package:laser/app/data/models/device_model.dart';
import 'package:laser/app/data/models/device_type_model.dart';
import 'package:laser/app/data/models/service_model.dart';
import 'package:laser/app/routes/app_pages.dart';
import 'package:location/location.dart';

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

  controlleDate(String date) {
    String desiredOutput = date.toString().substring(0, 10);

    this.chosenDate.value = desiredOutput;
    getWorkingHours(
        lang: LocalizationService.isItEnglish() ? "en" : "ar",
        date: this.chosenDate.value);

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

    deviceColorClicked(
      index: index,
    );
    update(); // Call this if you're using GetX and you need to update the UI
  }

  void setActiveServicesIndex(int index) {
    activeServiceModelIndex.value = index;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scroll(isService: true);
    });

    MySharedPref.saveService(serviceList[index].serviceId.toString());
    update();
  }

  void setHoursIndex(int index) {
    activeHoureIndex.value = index;
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

  void deviceColorClicked({required int index}) {
    // save device color and device type in shared pref
    MySharedPref.saveDeviceColor(
        deviceColorList[index]['color_name'].toString());
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

  getWorkingHours({String? lang, String? date}) async {
    await BaseClient.safeApiCall(
      Constants.getworkingtimeUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      data: {"date": date},
      onLoading: () {
        apiWorkingHoursCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        hoursList.value = RxList<dynamic>.from(
            response.data["payload"]["working_times"].map((e) => e));

        apiDeviceModelCallStatus.value = ApiCallStatus.success;
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
    dio.FormData formData = dio.FormData.fromMap({
      "device_type": "1",
      "device_brand": "13",
      "device_model": "5",
      "device_color_name": "Black",
      "problem_info": "Test",
      "address": "test address",
      "arrival_date": "2024-02-20",
      "arrival_time": "10:00 : 11:00",
      "payment_type": "1",
      "device_services": ["1", "6"],
      // "images": ["jfhjef.jpj"]
    });
    print(pickedImages);
    await BaseClient.safeApiCall(
      Constants.createMaintenanceOrderUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      data: {
        "device_type": "1",
        "device_brand": "13",
        "device_model": "5",
        "device_color_name": "Black",
        "problem_info": "Test",
        "address": "test address",
        "arrival_date": "2024-02-20",
        "arrival_time": "10:00 : 11:00",
        "payment_type": "1",
        "device_services": ["1", "6"],
        // "images": ["jfhjef.jpj"]
      },
      onLoading: () {
        // apiWorkingHoursCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // hoursList.value = RxList<dynamic>.from(
        //     response.data["payload"]["working_times"].map((e) => e));
        print(response.data["payload"]["order_id"].toString());
        pageController.value
            .nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut)
            .then((value) =>
                Get.find<HomeController>().visibilityOfBanner.value = false);
        // apiDeviceModelCallStatus.value = ApiCallStatus.success;
        // deviceModelVisibleController.value = true;
        update();
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        // apiWorkingHoursCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
  }

  getAllOrders({String? lang}) async {
    await BaseClient.safeApiCall(
      Constants.getAllMaintenanceOrderUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.get,
      onLoading: () {
        // apiDeviceTypesCallStatus.value = ApiCallStatus.loading;
        // update();
      },
      onSuccess: (response) {
        // apiDeviceTypesCallStatus.value = ApiCallStatus.success;

        // deviceTypeList = RxList<DeviceType>.from(response.data["payload"]
        //         ["device_types"]
        //     .map((e) => DeviceType.fromJson(e as Map<String, dynamic>))
        //     .toList());

        print(response.data["payload"]["data"]);

        update();
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        // apiDeviceTypesCallStatus.value = ApiCallStatus.error;
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

//? pick multiple images from device
  pickImages() async {
    List<XFile> images = await ImagePicker().pickMultiImage();

    pickedImages.value = await Future.wait(images.map((image) async {
      return await dio.MultipartFile.fromFile(image.path, filename: image.name);
    }).toList());

    // return images;
  }

//? pick multiple videos from device using file picker
  pickVideos() async {
    List<PlatformFile> videos = (await FilePicker.platform.pickFiles(
          type: FileType.video,
          allowMultiple: true,
          allowCompression: true,
        ))
            ?.files ??
        [];

    videos.take(2).forEach((element) {
      pickedVideos.value.add(dio.MultipartFile.fromFileSync(element.path!,
          filename: element.name));
    });
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

  Future<String> getCurrentLocationAddress() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    // Check if location service is enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Handle case when user denies location service
        return "";
      }
    }

    // Check if location permission is granted
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // Handle case when user denies location permission
        return "";
      }
    }

    // Get current location
    locationData = await location.getLocation();

    // Get address from coordinates
    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );

    return "${placemarks[0].name! + ',' + placemarks[0].street! + ',' + placemarks[0].country!}";
  }

  Future<void> supmitService() async {
    addressController.text = await getCurrentLocationAddress();
    return pageController.value.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
