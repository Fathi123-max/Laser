import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_snackbar.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/data/models/order_model.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/big_text_filed.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';
import 'package:laser/app/modules/home/views/widgets/orders/custom_card_button.dart';
import 'package:laser/app/modules/home/views/widgets/page_banner.dart';
import 'package:laser/app/modules/home/views/widgets/payment/number_of_service_needed.dart';
import 'package:laser/app/modules/home/views/widgets/payment/payment_method_list_tile.dart';
import 'package:laser/app/modules/home/views/widgets/payment/total_price.dart';
import 'package:laser/app/routes/app_pages.dart';
import 'package:laser/app/services/payment/billing_data.dart';
import 'package:laser/app/services/payment/flutter_paymob.dart';

class PaymentDetailsPage extends GetView<HomeController> {
  const PaymentDetailsPage({
    super.key,
    this.order,
  });

  final OrderModel? order;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(30),
          const PageBanner(
              pageIndex: 5, pageTitle: "Payment Details", pageSubTitle: ""),
          const Gap(36),
          NumberOfServiceNeeded(counter: order!.services!.split("\n").length),
          const Gap(13),
          const CustomDivider(),
          const Gap(19),
          TotalPrice(counter: order!.totalPrice),
          const Gap(28),
          Column(
            children: [
              Row(
                children: [
                  const Gap(32),
                  Text("Do you have a discount?",
                      style: MyStyles().fontSize12Weight700),
                ],
              ),
              const Gap(8),
              Row(
                children: [
                  const Gap(32),
                  BigTextFiled(
                    width: 200.w,
                    height: 34.h,
                  ),
                  const Gap(19),
                  CustomCardButton(
                    color: Colors.black,
                    heaight: 30.h,
                    bold: true,
                    text: "Active",
                    colorText: Colors.white,
                    width: 101.w,
                    fontsize: 14.sp,
                  )
                ],
              ),
              const Gap(28),
              Row(
                children: [
                  const Gap(32),
                  Text('Payment Method',
                      textAlign: TextAlign.center,
                      style: MyStyles().languageButtonStyle.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          )),
                ],
              ),
              Gap(13.h),
              const PaymentMethodListTile(
                fileName: "credit.png",
                done: true,
              ),
            ],
          ),
          const Gap(20),
          CustomCardButton(
            color: Colors.black,
            heaight: 30.h,
            bold: true,
            onTap: () async {
              await FlutterPaymob.instance.payWithCard(
                billingData: BillingData(
                  email: "claudette09@exa.com",
                  firstName: "Clifford",
                  lastName: "Nicolas",
                  phoneNumber: "+86(8)9135210487",
                  postalCode: "01898",
                  city: "Jaskolskiburgh",
                  country: "SAU",
                  state: "Saudi Arabia",
                  building: "8028",
                  floor: "42",
                  apartment: "803",
                  street: "Ethan Land",
                  shippingMethod: "PKG",
                ),
                context:
                    context, // Passes the BuildContext required for UI interactions
                currency:
                    "SAR", // Specifies the currency for the transaction (Egyptian Pound)
                amount: 1, // Sets the amount of money to be paid (100 EGP)
                // Optional callback function invoked when the payment process is completed
                onPayment: (response) {
                  // Checks if the payment was successful

                  if (response.success == true) {
                    controller.orderDetails(
                        lang: LocalizationService.isItEnglish() ? "en" : "ar",
                        orderId: order!.orderId!,
                        index: 0);

                    Get.offNamed(
                      Routes.AFTER_ORDER_PAID_PAGE,
                    );
                  } else if (response.success == false) {
                    print(response.message);
                    print(response.responseCode);
                    print(response.success);
                    print(response.transactionID);
                    CustomSnackBar.showCustomSnackBar(
                      title: "Faild payment",
                      message: "payment ",
                    );
                    Get.off(() => PaymentErrorPage(
                          errorMessage: response.message!,
                          onRetry: () async {
                            CustomSnackBar.showCustomSnackBar(
                              title: "Retry the payment",
                              message: "",
                            );
                          },
                          onGoBack: () => Get.back(),
                        ));

                    Get.back();
                  }
                },
              );
            },
            text: "Pay Now",
            colorText: Colors.white,
            width: 101.w,
            fontsize: 14.sp,
          )
        ],
      ),
    );
  }
}

class PaymentErrorPage extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final VoidCallback onGoBack;

  PaymentErrorPage({
    Key? key,
    required this.errorMessage,
    required this.onRetry,
    required this.onGoBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        title: const Text('Payment Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.error_outline,
              size: 70,
              color: Colors.redAccent,
            ),
            const SizedBox(height: 20),
            const Text(
              'Oops! Something went wrong.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry Payment'),
            ),
            TextButton(
              onPressed: onGoBack,
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
