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

  void removeService({
    required int index,
    required int serviceId,
    required services,
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
        "order_code": "order_Code" // todo need to add
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

  void onmyway({
    required int index,
    required int orderid,
    String? lang,
  }) async {
    await BaseClient.safeApiCall(
      Constants.removeServiceUrl,
      headers: {
        "Accept-Language": lang,
        "Authorization": "Bearer ${MySharedPref.getCurrentToken()}",
      },
      RequestType.post,
      queryParameters: {
        "service_id": orderid,
      },
      // data: {"order_id", orderId},
      onLoading: () {
        // *) indicate loading state
        // apiDeviceBrandsCallStatus.value = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // *) indicate success
        // services.removeWhere(
        //     (element) => element.serviceId == services[index].serviceId);
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

  void acceptOrder({
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
    String? techComments,
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
      data: {"order_id": orderId, "tech_comments": techComments},
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
}
