import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

import '../widgets/orders/card_details.dart';

class OrderPage extends GetView<HomeController> {
  const OrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(27.w),
        child: Column(
          children: [
            SizedBox(
              width: 83.w,
              child: Text('Orders',
                  textAlign: TextAlign.center,
                  style: MyStyles().languageButtonStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      )),
            ),
            const Gap(24),
            SizedBox(
                width: 273.w,
                child: Text(
                    'After order is accepted you can pay the amount needed.',
                    style: MyStyles().fontSize12Weight400)),
            const Gap(19),
            Obx(() {
              return SizedBox(
                height: 430.h,
                child: ListView.builder(
                  controller: controller.scrollOrderController,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.orderList.value.length,
                  itemBuilder: (context, index) {
                    return CardDetails(
                      index: index,
                    );
                  },
                ),
              );
            })

            // const ,
            // const CardDetails(),
            // const CardDetails(),
            // const CardDetails(),
          ],
        ),
      ),
    );
  }
}
