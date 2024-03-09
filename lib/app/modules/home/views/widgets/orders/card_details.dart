import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/components/custom_loading_overlay.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/modules/home/controllers/controller_helper/controll_order_status.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';

import 'custom_card_button.dart';

class CardDetails extends GetWidget<HomeController> {
  const CardDetails({
    required this.index,
    super.key,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(bottom: 13.h),
        child: Container(
          width: 300.w,
          height: 185.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x02000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 1,
              )
            ],
          ),
          child: Column(children: [
            Gap(13.h),
            Row(
              children: [
                const Gap(24),
                Text(
                    'Order number ${controller.orderList.value[index].orderId}',
                    textAlign: TextAlign.center,
                    style: MyStyles().fontSize12Weight700),
                const Spacer(),
                Obx(() {
                  return Visibility(
                    visible: controller.detailskey.value,
                    child: CustomCardButton(
                      text: "Details",
                      color: const Color(0xFFF1F0F5),
                      onTap: () {
                        showLoadingOverLay(
                            asyncFunction: () => controller.orderDetails(
                                lang: LocalizationService.isItEnglish()
                                    ? "en"
                                    : "ar",
                                orderId:
                                    controller.orderList.value[index].orderId!,
                                index: index));
                      },
                    ),
                  );
                }),
                const Gap(12)
              ],
            ),
            const Gap(19),
            Row(
              children: [
                const Gap(28),
                AssetImageView(
                    fileName: "phone.png", height: 26.h, width: 20.w),
                const Gap(31),
                Text('${controller.orderList.value[index].deviceName}',
                    textAlign: TextAlign.center,
                    style: MyStyles().fontSize12Weight400)
              ],
            ),
            const Gap(13),
            Row(children: [
              const Gap(24),
              Text(
                'Issue',
                textAlign: TextAlign.center,
                style: MyStyles().fontSize12Weight400,
              ),
              const Gap(25),
              Text('${controller.orderList.value[index].services!}',
                  textAlign: TextAlign.center,
                  style: MyStyles()
                      .languageButtonStyle
                      .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400))
            ]),
            Gap(18.h),
            const CustomDivider(fullWidth: true),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCardButton(
                  width: 74.sp,
                  heaight: 22.h,
                  text:
                      "${controller.orderList.value[index].currentStatusName}",
                  color: controller.hexToColor(
                      controller.orderList.value[index].currentStatusColor!),
                  onTap: () {},
                ),
                const Gap(12),
                if (controller.orderList.value[index].nextStatusName != null)
                  CustomCardButton(
                      heaight: 22.h,
                      width: 96.sp,
                      text:
                          "${controller.orderList.value[index].nextStatusName}",
                      color: const Color(0xFFF1F0F5),
                      onTap: Get.put(OrderStatusController())
                          .controlOrderStatusButton(
                              controller.orderList.value[index], context))
                else
                  Container(
                    width: 96.sp,
                  ),
                const Gap(13),
                Text('Total ', style: MyStyles().fontSize12Weight400),
                Text(
                  '${controller.orderList.value[index].totalPrice} SAR',
                  style: const TextStyle(
                    color: Color(0xFF1B1926),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0.10,
                  ),
                ),
              ],
            ),
            const Gap(19)
          ]),
        ),
      ),
    );
  }
}
