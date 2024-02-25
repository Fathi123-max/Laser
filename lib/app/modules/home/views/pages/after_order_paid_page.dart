import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/orders/address.dart';
import 'package:laser/app/modules/home/views/widgets/orders/back_but.dart';

import '../widgets/orders/order_number.dart';
import '../widgets/orders/order_price.dart';
import '../widgets/orders/receipt_button.dart';
import '../widgets/orders/service_detailes.dart';
import '../widgets/orders/time_date_order.dart';

class AfterOrderPaidPage extends GetView<HomeController> {
  const AfterOrderPaidPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(42),
          const OrderNumber(),
          const Gap(12),
          const TimeDateOrder(),
          const Gap(36),
          const OrderPrice(),
          const Gap(22),
          Address(
            customWidth: 300.w,
          ),
          const Gap(16),
          const ServiceDetailes(),
          const Gap(18),
          const ReceiptButton(),
          const Gap(59),
          const BackBut()
        ],
      ),
    );
  }
}
