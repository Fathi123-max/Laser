import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/views/widgets/big_text_filed.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';
import 'package:laser/app/modules/home/views/widgets/orders/custom_card_button.dart';
import 'package:laser/app/modules/home/views/widgets/page_banner.dart';
import 'package:laser/app/modules/home/views/widgets/payment/number_of_service_needed.dart';
import 'package:laser/app/modules/home/views/widgets/payment/payment_method_list_tile.dart';
import 'package:laser/app/modules/home/views/widgets/payment/total_price.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(30),
        const PageBanner(
            pageIndex: 5, pageTitle: "Payment Details", pageSubTitle: ""),
        const Gap(36),
        const NumberOfServiceNeeded(),
        const Gap(13),
        const CustomDivider(),
        const Gap(19),
        const TotalPrice(),
        const Gap(28),
        Column(
          children: [
            Row(
              children: [
                const Gap(32),
                Text(
                  "Do you have a discount?",
                  style: MyStyles().languageButtonStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                ),
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
            const PaymentMethodListTile(),
            const Gap(19),
            const PaymentMethodListTile(
              fileName: "credit.png",
              done: true,
            )
          ],
        )
      ],
    );
  }
}
