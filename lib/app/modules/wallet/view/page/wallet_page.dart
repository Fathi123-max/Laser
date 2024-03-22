import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/modules/wallet/controller/walletController.dart';

class WalletPage extends GetView<WalletController> {
  const WalletPage({super.key});

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
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
    var textStyle2 = TextStyle(
      color: const Color(0xFF1B1926),
      fontSize: 20.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Wallet',
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 74.h,
                ),
                GestureDetector(
                  child: BalanceWidget(
                      shapeDecoration: shapeDecoration,
                      textStyle: textStyle,
                      textStyle2: textStyle2),
                )
              ]),
        ));
  }
}

class BalanceWidget extends GetView<WalletController> {
  const BalanceWidget({
    super.key,
    required this.shapeDecoration,
    required this.textStyle,
    required this.textStyle2,
  });

  final ShapeDecoration shapeDecoration;
  final TextStyle textStyle;
  final TextStyle textStyle2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 318.w,
          height: 72.h,
          decoration: shapeDecoration,
          child: Row(
            children: [
              SizedBox(
                width: 16.w,
              ),
              AssetImageView(
                width: 33.w,
                height: 21.h,
                fileName: "cash.png",
              ),
              SizedBox(
                width: 11.w,
              ),
              Text(
                'My Balance',
                textAlign: TextAlign.center,
                style: textStyle,
              ),
              SizedBox(
                width: 68.w,
              ),
              Text(
                '${controller.balance!.value} SAR',
                textAlign: TextAlign.center,
                style: textStyle2,
              )
            ],
          ),
        ),
      ],
    );
  }
}
