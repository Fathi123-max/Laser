import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';

import '../../../controllers/home_controller.dart';

class OrderPrice extends GetView<HomeController> {
  const OrderPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(40),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Total ', style: MyStyles().fontSize12Weight400),
              TextSpan(
                  text: '${controller.priceAfetrSucsses.value.toString()} SAR',
                  style: MyStyles().fontSize14Weight700),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(56),
        const Text(
          "|",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(40),
        AssetImageView(height: 17.h, width: 27.w, fileName: "cash.png"

            // color: Colors.transparent,
            ),
        const Gap(7),
        Text(
            // controller.paymentType.value == "Card"
            //     ? 'Paid in Credit'
            //     : "paid with Apple",
            'Paid with Card',
            textAlign: TextAlign.center,
            style: MyStyles().fontSize12Weight400)
      ],
    );
  }
}
