import 'package:flutter/material.dart';
import 'package:laser/app/services/payment/paymob_response.dart';
//import webview
import 'package:webview_flutter/webview_flutter.dart';

class PaymobIFrame extends StatefulWidget {
  const PaymobIFrame({
    super.key,
    required this.redirectURL,
    this.onPayment,
  });

  final String redirectURL;
  final void Function(PaymentPaymobResponse)? onPayment;

  static Future<PaymentPaymobResponse?> show({
    required BuildContext context,
    required String redirectURL,
    void Function(PaymentPaymobResponse)? onPayment,
  }) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return PaymobIFrame(
              onPayment: onPayment,
              redirectURL: redirectURL,
            );
          },
        ),
      );

  @override
  State<PaymobIFrame> createState() => _PaymobIFrameState();
}

class _PaymobIFrameState extends State<PaymobIFrame> {
  WebViewController? controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('txn_response_code') &&
                request.url.contains('success') &&
                request.url.contains('id')) {
              final params = _getParamFromURL(request.url);
              print("params");
              print(params);
              final response = PaymentPaymobResponse.fromJson(params);
              if (widget.onPayment != null) {
                widget.onPayment!(response);
              }
              Navigator.pop(context, response);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.redirectURL));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : SafeArea(
              child: WebViewWidget(
                controller: controller!,
              ),
            ),
    );
  }

  Map<String, dynamic> _getParamFromURL(String url) {
    final uri = Uri.parse(url);
    Map<String, dynamic> data = {};
    uri.queryParameters.forEach((key, value) {
      data[key] = value;
    });
    return data;
  }
}
