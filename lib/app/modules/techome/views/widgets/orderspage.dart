import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';
import 'package:laser/app/modules/home/views/widgets/orders/custom_card_button.dart';
import 'package:laser/app/modules/techome/controller/techomecontroller.dart';

import '../../../../config/theme/my_styles.dart';

class OrdersPage extends GetView<TecHomeController> {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Color(0xFF1B1926),
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      height: 0.08,
    );

    return const SingleChildScrollView(
        child: Column(children: [
      Gap(42),
      SizedBox(
        width: 161,
        child: Text(
          'Accepted Orders',
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
      Gap(19),
      Expandable(
        boxShadow: [],
        backgroundColor: Color(0xFFF1F0F5),
        firstChild: OrderHeader(),
        secondChild: OrderBody(),
        showArrowWidget: false,
        centralizeFirstChild: true,

        // arrowWidget: SizedBox.shrink(),
        // subChild: Text("Show Details"),
      ),
    ]));
  }
}

class OrderHeader extends StatelessWidget {
  const OrderHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          const Text(
            'Order number 226',
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          const Gap(80),
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
          )
        ],
      ),
    );
  }
}

class OrderBody extends StatelessWidget {
  const OrderBody({super.key});

  @override
  Widget build(BuildContext context) {
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
        height: 300.h,
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
                Text('Mobiles-iphone 8 plus',
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
                height: 22.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
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
                            width: 74.sp,
                            height: 22.h,
                            // text:
                            //     "${controller.orderList.value[index].currentStatusName}",
                            // color: controller.hexToColor(
                            //     controller.orderList.value[index].currentStatusColor!),
                            onTap: () {},
                            color: Colors.amber.shade300,
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
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
                            ))
                      ],
                    );
                  },
                ),
              )
            ]),
            const Gap(10),
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
            const ActionButtons()
          ],
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 131.w,
          height: 21.h,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: const Color(0xFF1B1D28),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'On my way',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0.14,
            ),
          ),
        )
      ],
    );
  }
}

class Delivery extends StatelessWidget {
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

class Address extends StatelessWidget {
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

class TotalPrice extends StatelessWidget {
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
