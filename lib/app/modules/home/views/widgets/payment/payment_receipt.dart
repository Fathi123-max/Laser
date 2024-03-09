import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';
import 'package:laser/app/modules/home/views/widgets/orders/custom_card_button.dart';

class PaymentPage extends GetView<HomeController> {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: UniqueKey(),
        body: Column(
          children: [
            Gap(40.h),
            Padding(
              padding: EdgeInsets.all(25.w),
              child: Container(
                width: 328.w,
                height: 370.h,
                decoration: const BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Gap(30),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Gap(23),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order number 226',
                                    textAlign: TextAlign.center,
                                    style: MyStyles().fontSize12Weight700),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Order date: 2-1-2024',
                                        textAlign: TextAlign.center,
                                        style: MyStyles()
                                            .fontSize12Weight400
                                            .copyWith(
                                              fontSize: 10.sp,
                                            )),
                                    const Gap(8),
                                    Text(
                                      ' ( 11:00 - 12:00)',
                                      textAlign: TextAlign.center,
                                      style: MyStyles()
                                          .fontSize12Weight400
                                          .copyWith(
                                            fontSize: 10.sp,
                                          ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            const AssetImageView(
                                fileName: "logo_black.png",
                                height: 53,
                                width: 44),
                            const Gap(19)
                          ]),
                      const Gap(43),
                      const CustomDivider(
                        fullWidth: true,
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          const Gap(25),
                          Text(
                            "Type",
                            style: MyStyles().fontSize14WeightBold,
                          ),
                          const Spacer(),
                          Text("Price", style: MyStyles().fontSize14WeightBold),
                          const Gap(24),
                        ],
                      ),
                      const CustomDivider(
                        fullWidth: true,
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          const Gap(25),
                          Text(
                            "Mobiles-iphone 8 plus - software services",
                            style: MyStyles()
                                .fontSize12Weight400
                                .copyWith(fontSize: 11.sp),
                          ),
                          const Spacer(),
                          Text("120", style: MyStyles().fontSize14WeightBold),
                          Text(" SAR", style: MyStyles().fontSize14Weight400),
                          const Gap(24),
                        ],
                      ),
                      const CustomDivider(
                        fullWidth: true,
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          const Gap(22),
                          CustomCardButton(
                              heaight: 20.sp,
                              width: 50.sp,
                              color: Colors.green,
                              colorText: Colors.white),
                          const Spacer(),
                          Text("20",
                              style: MyStyles().fontSize14WeightBold.copyWith(
                                    color: Colors.green,
                                  )),
                          Text(" SAR", style: MyStyles().fontSize14Weight400),
                          const Gap(24),
                        ],
                      ),
                      const CustomDivider(
                        fullWidth: true,
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          const Gap(25),
                          Text(
                            "Total",
                            style: MyStyles().fontSize12Weight400,
                          ),
                          const Spacer(),
                          Text("100", style: MyStyles().fontSize14WeightBold),
                          Text(" SAR", style: MyStyles().fontSize14Weight400),
                          const Gap(24),
                        ],
                      ),
                      const Gap(20),
                      const CustomDivider(
                        fullWidth: true,
                        thickness: 2,
                        color: Colors.black,
                      ),
                      const Gap(20),
                      Text(
                          style: MyStyles()
                              .fontSize12Weight400
                              .copyWith(fontSize: 11),
                          textAlign: TextAlign.center,
                          "You can reach our Customer Experience team through the app\n chat or email at: support@lazer.sa"),
                      const Gap(23),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Company Registered Nymber:",
                              style: MyStyles().fontSize12WeightBold),
                          Text("101472", style: MyStyles().fontSize12Weight400),
                        ],
                      ),
                      const Gap(68),
                    ],
                  ),
                ),
              ),
            ),
            CustomCardButton(
                heaight: 27.sp,
                width: 131.sp,
                text: "Download",
                color: Colors.black,
                colorText: Colors.white),
            Gap(20.h),
          ],
        ));
  }
}
