import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_snackbar.dart';
import 'package:laser/app/core/constants.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/data/models/techmodels/acceptedorders.dart';
import 'package:laser/app/data/models/techmodels/pendingorders.dart';
import 'package:laser/app/services/base_client.dart';

class TecHomeController extends GetxController {
  var pageController = PageController().obs;
  Rx<TextEditingController> orderCodeEditingController =
      TextEditingController().obs;
  Rx<TextEditingController> removeEditingController =
      TextEditingController().obs;
  Rx<TextEditingController> techMessageEditingController =
      TextEditingController().obs;
  RxBool holdOrderType = false.obs;
  RxBool editOrder = true.obs;
  RxList<PendingOrders> pendingOrders = RxList<PendingOrders>([]);

  Future<void> getPendingOrders({String? lang, int? index}) async {
    await BaseClient.safeApiCall(
      Constants.pendingOrdersrUrl(index ?? 0),
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

        // If this is not the first page, append the new orders to the existing list.
        if (index != null && index > 1) {
          var newOrders = RxList<PendingOrders>.from(response.data["payload"]
                  ["data"]
              .map((e) => PendingOrders.fromJson(e as Map<String, dynamic>))
              .toList());

          // Add the new orders to the existing list.
          pendingOrders.addAll(newOrders);
        } else {
          // If this is the first page, replace the existing list with the new orders.
          pendingOrders = RxList<PendingOrders>.from(response.data["payload"]
                  ["data"]
              .map((e) => PendingOrders.fromJson(e as Map<String, dynamic>))
              .toList());
        }

        pendingOrders.refresh();
        print(pendingOrders.value.first.orderId);
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
        // apiDeviceTypesCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
    return Future(() => true);
  }

  RxList<AcceptedOrder> acceptedOrders = RxList<AcceptedOrder>([]);

  Future<void> getAcceptedOrders({String? lang, int? index}) async {
    await BaseClient.safeApiCall(
      Constants.acceptedOrdersrUrl(index ?? 0),
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

        // If this is not the first page, append the new orders to the existing list.
        if (index != null && index > 1) {
          var newOrders = RxList<AcceptedOrder>.from(response.data["payload"]
                  ["data"]
              .map((e) => AcceptedOrder.fromJson(e as Map<String, dynamic>))
              .toList());

          // Add the new orders to the existing list.
          acceptedOrders.addAll(newOrders);
        } else {
          // If this is the first page, replace the existing list with the new orders.
          acceptedOrders = RxList<AcceptedOrder>.from(response.data["payload"]
                  ["data"]
              .map((e) => AcceptedOrder.fromJson(e as Map<String, dynamic>))
              .toList());
        }

        acceptedOrders.refresh();
        print(acceptedOrders.value.first.orderId);
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
        // apiDeviceTypesCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
    return Future(() => true);
  }

  RxList<PendingOrders> finishedOrders = RxList<PendingOrders>([]);

  Future<void> getFinishedOrders({String? lang, int? index}) async {
    await BaseClient.safeApiCall(
      Constants.finishedOrdersrUrl(index ?? 0),
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

        // If this is not the first page, append the new orders to the existing list.
        if (index != null && index > 1) {
          var newOrders = RxList<PendingOrders>.from(response.data["payload"]
                  ["data"]
              .map((e) => PendingOrders.fromJson(e as Map<String, dynamic>))
              .toList());

          // Add the new orders to the existing list.
          finishedOrders.addAll(newOrders);
        } else {
          // If this is the first page, replace the existing list with the new orders.
          finishedOrders = RxList<PendingOrders>.from(response.data["payload"]
                  ["data"]
              .map((e) => PendingOrders.fromJson(e as Map<String, dynamic>))
              .toList());
        }

        finishedOrders.refresh();
        print(finishedOrders.value.first.orderId);
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
        // apiDeviceTypesCallStatus.value = ApiCallStatus.error;
        update();
      },
    );
    return Future(() => true);
  }

  void removeService({
    required int index,
    required int serviceId,
    required services,
    String? orderCode,
    String? lang,
    int? orderId,
  }) async {
    await BaseClient.safeApiCall(
      Constants.removeServiceUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      queryParameters: {
        "order_id": orderId,
        "service_id": serviceId,
        "order_code": orderCode,
      },
      // data: {"order_id", orderId},
      onLoading: () {
        // *) indicate loading state
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // *) indicate success
        services.removeWhere(
            (element) => element.serviceId == services[index].serviceId);
        Get.back();
        // order.services.refresh();

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

  RxBool isMyWay = RxBool(false);
  RxBool finishOrder = RxBool(false);
  RxBool updateOrder = RxBool(false);

  Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  void onMyWay({
    required int index,
    required int orderid,
    String? lang,
  }) async {
    await BaseClient.safeApiCall(
      Constants.onmywayUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      queryParameters: {
        "order_id": orderid,
        "order_code": removeEditingController.value.text,
        // todo need to add
      },
      // data: {"order_id", orderId},
      onLoading: () {
        // *) indicate loading state
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // *) indicate success
        Get.back();

        acceptedOrders.refresh();

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

  Future<void> acceptOrder({
    required PendingOrders order,
    required int? index,
    String? lang,
  }) async {
    await BaseClient.safeApiCall(
      Constants.orderacceptUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      queryParameters: {
        "order_id": order.orderId,
      },
      // data: {"order_id", orderId},
      onLoading: () {
        // *) indicate loading state
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // *) indicate success
        pendingOrders
            .removeWhere((element) => element.orderId == order.orderId);
        pendingOrders.refresh();

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

  void holdOrder({
    int? orderId,
    int? index,
    String? lang,
  }) async {
    await BaseClient.safeApiCall(
      Constants.orderacceptUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      data: {
        "order_id": orderId,
        "tech_comments": techMessageEditingController.value.text,
      },
      // data: {"order_id", orderId},
      onLoading: () {
        // *) indicate loading state
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // *) indicate success
        // pendingOrders
        //     .removeWhere((element) => element.orderId == order.orderId);
        // pendingOrders.refresh();

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

  void finishTheOrder({
    int? orderId,
    int? index,
    String? lang,
  }) async {
    await BaseClient.safeApiCall(
      Constants.orderfinishUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      data: {
        "order_id": orderId,
        "order_code": removeEditingController.value.text,
      },
      // data: {"order_id", orderId},
      onLoading: () {
        // *) indicate loading state
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // *) indicate success
        // pendingOrders
        //     .removeWhere((element) => element.orderId == order.orderId);
        // pendingOrders.refresh();

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

  void visibiltyFunction({AcceptedOrder? order}) {
    switch (order!.nextStatus) {
      case "On my way":
        isMyWay.value = true;
        finishOrder.value = false;
        updateOrder.value = false;
        update();
        break;

      case "Update Order":
        isMyWay.value = false;
        finishOrder.value = false;
        updateOrder.value = true;
        update();
        break;
      default:
    }
  }

  void visibiltyFinishFunction({AcceptedOrder? order}) {
    switch (order!.finishRoute) {
      case "order-finish":
        // isMyWay.value = true;
        finishOrder.value = true;
        // updateOrder.value = false;
        break;

      default:
        finishOrder.value = false;
    }
  }
}
