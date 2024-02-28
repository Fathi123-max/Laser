import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/services/payment/billing_data.dart';
import 'package:laser/app/services/payment/flutter_paymob.dart';

import '../custom_appbar_icon.dart';
import '../custom_drawer.dart';
import '../navgation_text_buttons.dart';

class HomeBaseViewModel extends GetView<HomeController> {
  const HomeBaseViewModel({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Column(children: [
          FloatingActionButton(
            child: const Icon(Icons.inbox),
            onPressed: () async {
              await FlutterPaymob.instance
                  .initialize(
                      walletIntegrationId: 12,
                      apiKey:
                          "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TnpjNUxDSnVZVzFsSWpvaWFXNXBkR2xoYkNKOS40UTVRb0lpa3BoVFN1T0lBVktfTnJIMll3QXBoRmd4cjJBc0NMNVQ3V2RGNlFPNW9Jc1F1TFVON2dQTmFQWTlyT0R1S04zUzhWWUpuLTdqMzBPdUY5UQ==",
                      iFrameID: 904,
                      integrationID: 2038)
                  .then((value) async {});
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.monetization_on_outlined),
            onPressed: () async {
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
                amount: 100, // Sets the amount of money to be paid (100 EGP)
                // Optional callback function invoked when the payment process is completed
                onPayment: (response) {
                  // Checks if the payment was successful
                  if (response.success == true) {
                    // If successful, displays a snackbar with the success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(response.message ??
                            "Success"), // Shows "Success" message or response message
                      ),
                    );
                  }
                },
              );
            },
          ),
        ]),
        drawer: const CustomDrawer(),
        key: controller.scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(19),
              Row(children: [
                const Gap(24),
                CustomAppbarIcon(
                  fileName: "drawer.png",
                  height: 15.h,
                  width: 16.w,
                  onTap: () =>
                      controller.scaffoldKey.currentState?.openDrawer(),
                ),
                const Spacer(),
                CustomAppbarIcon(
                  fileName: "message.png",
                  onTap: () {},
                  height: 22.h,
                  width: 22.w,
                ),
                const Gap(15),
                CustomAppbarIcon(
                  onTap: () {},
                  fileName: "list_view.png",
                  height: 25.h,
                  width: 25.w,
                ),
                const Gap(19)
              ]),
              SizedBox(height: 550.h, child: child),
              Row(
                children: [
                  const Gap(50),
                  Obx(() => Visibility(
                        visible: controller.visibilityOfBackButton
                            .value, // Replace isVisible with your visibility condition
                        child: NavgationTextButtons(
                          text: "Back",
                          onTap: () {
                            controller.backButtonLogic();
                          },
                        ),
                      )),
                  const Spacer(),
                  Obx(() => Visibility(
                        visible: controller.visibilityOfNextButton
                            .value, // Replace isVisible with your visibility condition
                        child: NavgationTextButtons(
                          text: "Next",
                          onTap: () {
                            controller.pageController.value.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);

                            // controller.controllVisibilityOfButtons();
                          },
                        ),
                      )),
                  const Gap(51)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
