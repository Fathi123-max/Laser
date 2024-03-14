import 'dart:async';

import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/data/models/techmodels/acceptedorders.dart';
import 'package:laser/app/modules/Auth/controller/text_form_fied_controller.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';
import 'package:laser/app/modules/home/views/widgets/orders/custom_card_button.dart';
import 'package:laser/app/modules/techome/controller/techomecontroller.dart';

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
                    controller.getPendingOrders(index: currentPageIndex);

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
                    firstChild: OrderHeader(index: index),
                    secondChild: OrderBody(index: index),
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
  });
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
      height: 0.14,
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
    const textStyle3 = TextStyle(
      color: Color(0xFF34A300),
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
            child: const Text(
              'Due today',
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
  });
  final int? index;
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
                            color: Colors.amber.shade300,
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () {
                                controller.removeService(
                                    orderId: order.orderId,
                                    services: order.services,
                                    serviceId:
                                        order.services![index].serviceId!,
                                    index: index,
                                    lang: LocalizationService.isItEnglish()
                                        ? "en"
                                        : "ar");
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
            Delivery(textStyle: textStyle),
            const Gap(10),
            const CustomDivider(fullWidth: true),
            // const Gap(2),
            Address(textStyle: textStyle),
            const Gap(10),
            const CustomDivider(fullWidth: true),
            const Gap(4),
            TotalPrice(textStyle: textStyle),
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
        Obx(() {
          return Visibility(
            visible: controller.isMyWay.value,
            child: ActionButton(
              controller: controller,
              index: index,
              order: order,
              text: 'On My Way',
              ontap: () {
                Get.to(DialogScreen());

                // controller.onMyWay(
                //     index: index!,
                //     orderid: order!.orderId!,
                //     lang: LocalizationService.isItEnglish() ? "en" : "ar");
              },
            ),
          );
        }),
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
                  ontap: () {},
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
              ontap: () {},
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
            height: 0.14,
          ),
        ),
      ),
    );
  }
}

class Delivery extends GetView<TecHomeController> {
  const Delivery({
    super.key,
    required this.textStyle,
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
          Container(
            width: 14,
            height: 11,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/14x11"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(7),
          const Text(
            '11:00 - 12:00         ',
            style: TextStyle(
              color: Color(0xFF1B1926),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: 14,
            height: 11,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/14x11"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(7),
          const Text(
            '8-1-2024',
            style: TextStyle(
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
    required this.textStyle,
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
              'Address',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ],
        ),
        const Gap(8),
        Row(children: [
          const Gap(19),
          Container(
            width: 14,
            height: 11,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/14x11"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(7),
          const Text(
            'Alrehab District, Jeddah, Saudi Arabia',
            style: TextStyle(
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
    required this.textStyle,
  });

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
          Container(
            width: 14,
            height: 11,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/14x11"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(7),
          const Text(
            'Paid in Credit Card',
            style: TextStyle(
              color: Color(0xFF1B1926),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap(57),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Total ',
                  style: TextStyle(
                    color: Color(0xFF261919),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.14,
                  ),
                ),
                TextSpan(
                  text: '50 SAR',
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

class DialogScreen extends GetView<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: const Color(0xFF1B1926),
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
    return Scaffold(
        body: SafeArea(
            child: Dialog(
      child: Container(
        width: 319.w,
        height: 419.h,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.r)),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.close)),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            CheckboxWidget(
              textStyle: textStyle,
              ishold: false,
            ),
            SizedBox(
              height: 47.h,
            ),
            CheckboxWidget(
              textStyle: textStyle,
              ishold: true,
            )
          ],
        ),
      ),
    )));
  }
}

class CheckboxWidget extends StatelessWidget {
  final bool? ishold;

  const CheckboxWidget({
    super.key,
    required this.textStyle,
    this.ishold,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      value: true,
      checkboxShape: const CircleBorder(),
      controlAffinity: ListTileControlAffinity.leading,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 250.w,
            height: 40.h,
            child: ishold ?? false
                ? Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hold the order?\n',
                          style: TextStyle(
                            color: const Color(0xFF1B1926),
                            fontSize: 14.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Please mention the reason',
                          style: TextStyle(
                            color: const Color(0xFF1B1926),
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                : Text(
                    'Please enter customer’s\ncode to edit',
                    style: textStyle,
                  ),
          ),
          CustomDialogFiled(
            isRigter: ishold ?? false,
            keyboardType: TextInputType.number,
            hint: !ishold! ? "1234" : "Costumer didn’t respond",
          )
        ],
      ),
      onChanged: (value) {},
    );
  }
}

class CustomDialogFiled extends GetWidget<CustomTextFormFieldController> {
  const CustomDialogFiled({
    this.isRigter,
    super.key,
    this.textEditingController,
    this.keyboardType,
    this.hint,
    this.isPassword = false,
  });

  final TextEditingController? textEditingController;
  final String? hint;
  final bool isPassword;
  final bool? isRigter;

  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 180.w,
          height: isRigter! ? 91.h : 35.h,
          child: Obx(() {
            return TextField(
              maxLines: 1000,
              keyboardType: keyboardType,
              controller: textEditingController,
              obscureText: controller.isPasswordVisible.value && isPassword
                  ? true
                  : false,
              decoration: InputDecoration(
                hintText: hint,
                fillColor: const Color(0xFFF1F0F5),
                filled: true,
                hintStyle: TextStyle(
                  color: const Color(0xFF1B1926),
                  fontSize: isRigter! ? 13.sp : 15.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  // height: 0.08,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                errorMaxLines: 1,
                hintMaxLines: 3,
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                errorStyle: const TextStyle(
                  height: 0,
                  color: Color.fromRGBO(27, 25, 38, 1),
                  fontFamily: 'Inter',
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                ),
                contentPadding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 12.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
