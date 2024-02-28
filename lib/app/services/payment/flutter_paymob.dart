library flutter_paymob;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laser/app/services/base_client.dart';
import 'package:laser/app/services/payment/billing_data.dart';
import 'package:laser/app/services/payment/paymob_iframe.dart';
import 'package:laser/app/services/payment/paymob_response.dart';

import 'constants.dart';

class FlutterPaymob {
  // Necessary properties for managing Paymob instance
  /// from dashboard Select Settings -> Account Info -> API Key
  late String _authKey;
  late String _authToken;
  late String _paymentKey;
  late String _iFrameURL;
  late String _walletURL;
  late int _iFrameID;

  /// from dashboard Select Developers -> Payment Integrations -> Online Card ID

  late int _integrationId;

  /// from dashboard Select Developers -> Payment Integrations -> Online wallet

  late int _walletIntegrationId;

  /// from paymob Select Developers -> iframes

  late int _orderId;

  /// userTokenExpiration the expiration time for user token in seconds (3600 by default and max )

  late int _userTokenExpiration;
  bool _isInitialized = false;
  static FlutterPaymob instance = FlutterPaymob(); // Singleton instance
  Constants constants = Constants.production();

  // Initialize Paymob instance.
  // apiKey: API key for authentication
  // integrationID: Integration ID for card payments
  // walletIntegrationId: Integration ID for wallet payments
  // iFrameID: ID for iFrame
  // userTokenExpiration: Expiration time for user token
  Future<bool> initialize({
    /// from dashboard Select Settings -> Account Info -> API Key
    required String apiKey,

    /// from dashboard Select Developers -> Payment Integrations -> Online Card ID
    int? integrationID,

    /// from dashboard Select Developers -> Payment Integrations -> Online wallet
    int? walletIntegrationId,

    /// from paymob Select Developers -> iframes
    required int iFrameID,

    /// userTokenExpiration the expiration time for user token in seconds (3600 by default and max )
    int userTokenExpiration = 3600,
  }) async {
    if (_isInitialized) {
      return true;
    }
    // Initialize properties
    _authKey = apiKey;
    _integrationId = integrationID!;
    _walletIntegrationId = walletIntegrationId!;
    _iFrameID = iFrameID;
    _iFrameURL =
        'https://accept.paymobsolutions.com/api/acceptance/iframes/$_iFrameID?payment_token=';
    _isInitialized = true;
    _userTokenExpiration = userTokenExpiration;
    return _isInitialized;
  }

  var headers = {'Content-Type': 'application/json'};

  // Get API Key from the server.
  Future<String> getAuthToken() async {
    await BaseClient.safeApiCall(constants.authorization, RequestType.post,
        data: {
          "api_key":
              "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TnpjNUxDSnVZVzFsSWpvaWFXNXBkR2xoYkNKOS40UTVRb0lpa3BoVFN1T0lBVktfTnJIMll3QXBoRmd4cjJBc0NMNVQ3V2RGNlFPNW9Jc1F1TFVON2dQTmFQWTlyT0R1S04zUzhWWUpuLTdqMzBPdUY5UQ=="
        }, onSuccess: (response) {
      _authToken = response!.data["token"];
    });

    return _authToken;
  }

  // Get Order ID from the server.
  Future<int> _getOrderId(double amount, String currency) async {
    await BaseClient.safeApiCall(constants.order, RequestType.post, data: {
      "auth_token": _authToken,
      "delivery_needed": "false",
      "amount_cents": "${amount * 100}",
      "currency": currency,
      "items": []
    }, onSuccess: (response) {
      if (response.statusCode! >= 200) {
        _orderId = response.data["id"];
        return _orderId;
      } else {
        throw "Error";
      }
    });
    return _orderId;
  }

  // Request a payment token.
  Future<String> _requestToken({
    required double amount,
    required String currency,
    required String integrationId,
    required BillingData billingData,
  }) async {
    await BaseClient.safeApiCall(constants.keys, RequestType.post, data: {
      "auth_token": _authToken,
      "expiration": _userTokenExpiration,
      "amount_cents": "${amount * 100}",
      "order_id": _orderId,
      "billing_data": billingData.toJson(),
      "currency": currency,
      "integration_id": integrationId,
      "lock_order_when_paid": "false"
    }, onSuccess: (response) {
      _paymentKey = response.data["token"];
      return _paymentKey;
    });

    return _paymentKey;
  }

  // Request wallet URL for payment.
  Future<String> _requestUrlWallet({
    required String number,
  }) async {
    // Prepare request body
    Map<String, dynamic> requestBody = {
      "source": {"identifier": number, "subtype": "WALLET"},
      "payment_token": _paymentKey // token obtained in step 3
    };
    String requestBodyJson = jsonEncode(requestBody);
    // Send POST request to get wallet URL
    http.Response response = await http.post(Uri.parse(constants.wallet),
        body: requestBodyJson, headers: headers);
    // Process response
    if (response.statusCode >= 200) {
      _walletURL = jsonDecode(response.body)["redirect_url"];
      return _walletURL;
    } else {
      throw "Error";
    }
  }

  // Initiate payment with a card.
  Future payWithCard({
    required BuildContext context,
    required String currency,
    required double amount,
    void Function(PaymentPaymobResponse response)? onPayment,
    BillingData? billingData,
  }) async {
    await getAuthToken();
    await _getOrderId(amount, currency);
    _paymentKey = await _requestToken(
        integrationId: _integrationId.toString(),
        amount: amount,
        currency: currency,
        billingData: billingData ?? BillingData());

    final response = await PaymobIFrame.show(
      context: context,
      redirectURL: "$_iFrameURL$_paymentKey",
      onPayment: onPayment,
    );
    return response;
  }

  // Initiate payment with a wallet.
  Future payWithWallet({
    required BuildContext context,
    required String currency,
    required String number,
    required double amount,
    void Function(PaymentPaymobResponse response)? onPayment,
    BillingData? billingData,
  }) async {
    await getAuthToken();
    await _getOrderId(amount, currency);
    await _requestToken(
        integrationId: _walletIntegrationId.toString(),
        amount: amount,
        currency: currency,
        billingData: billingData ?? BillingData());
    await _requestUrlWallet(number: number);
    if (context.mounted) {
      final response = await PaymobIFrame.show(
        context: context,
        redirectURL: _walletURL,
        onPayment: onPayment,
      );
      return response;
    }
    return null;
  }
}
