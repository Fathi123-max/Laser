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
}
