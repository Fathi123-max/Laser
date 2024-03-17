import 'dart:async';

import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/data/models/techmodels/acceptedorders.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';
import 'package:laser/app/modules/home/views/widgets/orders/custom_card_button.dart';
import 'package:laser/app/modules/techome/controller/techomecontroller.dart';
import 'package:laser/app/modules/techome/views/widgets/accept_order_helper/dialog_screen.dart';
import 'package:laser/app/modules/techome/views/widgets/accept_order_helper/remove_dialog_screen.dart';

import '../../../../config/theme/my_styles.dart';

class AcceptedOrdersPage extends GetView<TecHomeController> {
  const AcceptedOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer? _debounce;
    int currentPageIndex = 1;

    const textStyle = TextStyle(
      color: Color(0xFF1B1926),
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      height: 0.08,
    );

    return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(children: [
          const Gap(42),
          const SizedBox(
            width: 161,
            child: Text(
              'Accepted Orders',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
          const Gap(19),
          Obx(() {
            return NotificationListener(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  if (_debounce?.isActive ?? false) {
                    _debounce!.cancel();
                  }
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    // Increment the page index and call getAllOrders with the new index.
                    currentPageIndex++;
                    controller.getAcceptedOrders(index: currentPageIndex);

                    // You might want to check if there's more data to load before calling this.
                  });
                }
                return true;
              },
              child: SizedBox(
                height: Get.height * .8,
                child: ListView.separated(
                  itemCount: controller.acceptedOrders.value.length,
                  separatorBuilder: (context, index) => const Gap(19),
                  itemBuilder: (context, index) => Expandable(
                    boxShadow: const [],
                    backgroundColor: const Color(0xFFF1F0F5),
                    firstChild: OrderHeader(
                      index: index,
                      order: controller.acceptedOrders.value[index],
                    ),
                    secondChild: OrderBody(
                        index: index,
                        order: controller.acceptedOrders.value[index]),
                    showArrowWidget: false,
                    centralizeFirstChild: true,
                  ),
                ),
              ),
            );
          }),
        ]));
  }
}

class OrderHeader extends GetView<TecHomeController> {
  const OrderHeader({
    super.key,
    this.index,
    this.order,
  });
  final AcceptedOrder? order;
  final int? index;
  @override
  Widget build(BuildContext context) {
    var order = controller.acceptedOrders.value[index!];
    var shapeDecoration = ShapeDecoration(
      color: const Color(0xFFF1F0F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
    const textStyle = TextStyle(
      color: Color(0xFF1B1926),
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      // height: 0.14,
    );
    const shapeDecoration2 = ShapeDecoration(
      color: Color(0xFFF1F0F5),
      shape: OvalBorder(),
    );
    var textStyle2 = TextStyle(
      color: const Color(0xFF1B1926),
      fontSize: 12.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
    var shapeDecoration3 = ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x02000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 1,
        )
      ],
    );
    var textStyle3 = TextStyle(
      color: controller.hexToColor(order.dateExpiry!.color!),
      fontSize: 8,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      height: 0.31,
    );
    return Container(
      width: 326.w,
      height: 43.h,
      decoration: shapeDecoration3,
      child: Row(
        children: [
          const Gap(15),
          Container(
            width: 66.w,
            height: 21.h,
            alignment: Alignment.center,
            decoration: shapeDecoration,
            child: Text(
              order.dateExpiry!.text!,
              textAlign: TextAlign.center,
              style: textStyle3,
            ),
          ),
          const Gap(17),
          Text(
            'Order number  ${order.orderId}',
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          // const Gap(80),
          const Spacer(),
          Container(
            width: 19.w,
            alignment: Alignment.center,
            height: 19.w,
            decoration: shapeDecoration2,
            child: Text(
              '+',
              textAlign: TextAlign.center,
              style: textStyle2,
            ),
          ),
          const Gap(10),
        ],
      ),
    );
  }
}

class OrderBody extends GetView<TecHomeController> {
  const OrderBody({
    super.key,
    this.index,
    this.order,
  });
  final int? index;
  final AcceptedOrder? order;
  @override
  Widget build(BuildContext context) {
    var order = controller.acceptedOrders.value[index!];
    var shapeDecoration = ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x02000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 1,
        )
      ],
    );
    var textStyle = TextStyle(
      color: const Color(0xFF1B1926),
      fontSize: 12.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );

    return Center(
      child: Container(
        margin: EdgeInsets.all(20.h),
        width: 326.w,
        height: 320.h,
        alignment: Alignment.center,
        decoration: shapeDecoration,
        child: Column(
          children: [
            const Gap(10),
            Row(
              children: [
                const Gap(28),
                AssetImageView(
                    fileName: "phone.png", height: 26.h, width: 20.w),
                const Gap(31),
                Text(order.deviceName!,
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
              SizedBox(
                width: 200.w,
                height: 50.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Gap(5),
                  scrollDirection: Axis.vertical,
                  itemCount: order.services!.length,
                  itemBuilder: (context, index) {
                    const textStyle = TextStyle(
                      color: Color(0xFF1B1926),
                      fontSize: 8,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    );
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: CustomCardButton(
                            width: 200.w,
                            height: 30.h,

                            text: order.services![index].serviceName.toString(),
                            // color: controller.hexToColor(
                            //     controller.orderList.value[index].currentStatusColor!),
                            onTap: () {},
                            color: Colors.black12,
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () {
                                Get.dialog(RemoveDialogScreen(
                                  ontap: () {
                                    controller.removeService(
                                        orderCode: controller
                                            .removeEditingController.value.text,
                                        services: order.services!,
                                        index: index,
                                        serviceId:
                                            order.services![index].serviceId!,
                                        orderId: order.orderId,
                                        lang: LocalizationService.isItEnglish()
                                            ? 'en'
                                            : 'ar');
                                  },
                                  index: index,
                                  acceptedOrder: order,
                                ));
                              },
                              child: Container(
                                width: 11.w,
                                alignment: Alignment.center,
                                height: 11.w,
                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape:
                                      OvalBorder(side: BorderSide(width: 0.05)),
                                ),
                                child: const Text(
                                  'x',
                                  textAlign: TextAlign.center,
                                  style: textStyle,
                                ),
                              ),
                            ))
                      ],
                    );
                  },
                ),
              )
            ]),
            // const Gap(10),
            const CustomDivider(fullWidth: true),
            // const Gap(12),
            Delivery(textStyle: textStyle, order: order),
            const Gap(10),
            const CustomDivider(fullWidth: true),
            // const Gap(2),
            Address(textStyle: textStyle, order: order),
            const Gap(10),
            const CustomDivider(fullWidth: true),
            const Gap(4),
            TotalPrice(textStyle: textStyle, order: order),
            const Gap(19),
            ActionButtons(
              index: index,
              order: order,
            )
          ],
        ),
      ),
    );
  }
}

class ActionButtons extends GetView<TecHomeController> {
  final int? index;
  final AcceptedOrder? order;
  const ActionButtons({
    super.key,
    this.index,
    this.order,
  });

  @override
  Widget build(BuildContext context) {
    controller.visibiltyFunction(order: order);
    controller.visibiltyFinishFunction(order: order);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: controller.isMyWay.value,
          child: ActionButton(
            controller: controller,
            index: index,
            order: order,
            text: 'On My Way',
            ontap: () {
              Get.dialog(RemoveDialogScreen(
                acceptedOrder: order,
                index: index,
                ontap: () {
                  controller.onMyWay(
                      index: index!,
                      orderid: order!.orderId!,
                      lang: LocalizationService.isItEnglish() ? "en" : "ar");
                },
              ));
              // Get.to(() => const );
            },
          ),
        ),
        Visibility(
          visible: controller.updateOrder.value,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ActionButton(
                  controller: controller,
                  index: index,
                  order: order,
                  text: 'Update Order',
                  ontap: () {
                    Get.dialog(UpdateHoldDialogScreen(
                      acceptedOrder: order,
                    ));
                  },
                ),
                Gap(Get.width * .2),
              ],
            ),
          ),
        ),
        Visibility(
          visible: controller.finishOrder.value,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ActionButton(
              controller: controller,
              index: index,
              order: order,
              width: 70.w,
              text: 'Finish',
              ontap: () {
                Get.dialog(RemoveDialogScreen(
                    acceptedOrder: order,
                    index: index,
                    ontap: () {
                      controller.finishTheOrder(
                          index: index!,
                          orderId: order!.orderId!,
                          lang:
                              LocalizationService.isItEnglish() ? "en" : "ar");
                    }));
              },
            ),
          ),
        )
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final String? text;

  final Function()? ontap;

  final double? width;

  final double? height;

  const ActionButton({
    super.key,
    required this.controller,
    required this.index,
    required this.order,
    this.text,
    this.ontap,
    this.width,
    this.height,
  });

  final TecHomeController controller;
  final int? index;
  final AcceptedOrder? order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width ?? 131.w,
        height: height ?? 21.h,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: const Color(0xFF1B1D28),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            // height: 0.14,
          ),
        ),
      ),
    );
  }
}

class Delivery extends GetView<TecHomeController> {
  final AcceptedOrder? order;
  const Delivery({
    super.key,
    this.order,
    required this.textStyle,
    r,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(19),
            Text(
              'Delivery time and date',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ],
        ),
        const Gap(8),
        Row(children: [
          const Gap(19),
          SizedBox(
            width: 14.w,
            height: 11.h,
            child: const AssetImageView(fileName: "time.png"),
          ),
          const Gap(7),
          Text(
            '${order!.time}         ',
            style: const TextStyle(
              color: Color(0xFF1B1926),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 14.w,
            height: 11.h,
            child: const AssetImageView(fileName: "date.png"),
          ),
          const Gap(7),
          Text(
            DateFormat('yyyy-MM-dd').format(order!.date!),
            style: const TextStyle(
              color: Color(0xFF1B1926),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ]),
      ],
    );
  }
}

class Address extends GetView<TecHomeController> {
  const Address({
    super.key,
    this.order,
    required this.textStyle,
  });

  final AcceptedOrder? order;

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(19),
            Text(
              'Address',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ],
        ),
        const Gap(8),
        Row(children: [
          const Gap(19),
          SizedBox(
            width: 14.w,
            height: 11.h,
            child: const AssetImageView(fileName: "location.png"),
          ),
          const Gap(7),
          Text(
            '${order!.address}',
            style: const TextStyle(
              color: Color(0xFF1B1926),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ]),
      ],
    );
  }
}

class TotalPrice extends GetView<TecHomeController> {
  const TotalPrice({
    super.key,
    this.order,
    required this.textStyle,
  });

  final AcceptedOrder? order;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Color(0xFF261919),
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      height: 0.10,
    );
    return Column(
      children: [
        Row(children: [
          const Gap(19),
          SizedBox(
            width: 14.w,
            height: 11.h,
            child: const AssetImageView(fileName: "cash.png"),
          ),
          const Gap(7),
          Text(
            order!.paymentType == 'Card'
                ? 'Paid in Credit Card'
                : "Paid in Apple Pay",
            style: const TextStyle(
              color: Color(0xFF1B1926),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap(57),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Total ',
                  style: TextStyle(
                    color: const Color(0xFF261919),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '${order!.totalPrice} SAR',
                  style: textStyle,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          )
        ]),
      ],
    );
  }
}
