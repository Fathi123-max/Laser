import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

import '../widgets/orders/address.dart';
import '../widgets/orders/back_but.dart';
import '../widgets/orders/card_details.dart';
import '../widgets/orders/contact_email.dart';
import '../widgets/orders/dlivery_time_and_date.dart';
import '../widgets/orders/technician_visit_status.dart';
import '../widgets/orders/warrenty_claimed.dart';

class OrderDitailsPage extends GetView<HomeController> {
  const OrderDitailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.detailskey.value = true;
        return true;
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(27.w),
          child: Column(
            children: [
              SizedBox(
                child: Text('Order Details',
                    textAlign: TextAlign.center,
                    style: MyStyles().languageButtonStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        )),
              ),
              const Gap(28),
              CardDetails(
                index: controller.orderindex!.value,
              ),
              const DliveryTimeAndDate(),
              const Gap(14),
              const Address(),
              const Gap(14),
              const TechnicianVisitStatus(),
              const Gap(17),
              const WarrentyClaimed(),
              const Gap(17),
              const ContactEmail(),
              const Gap(65),
              BackBut(OnTap: () {
                if (controller.pageController.value.page == 5) {
                  controller.pageController.value.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                  controller.detailskey.value = true;
                } else {
                  Get.back();
                  controller.detailskey.value = true;
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
