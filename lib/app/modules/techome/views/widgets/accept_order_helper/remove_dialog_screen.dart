import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_snackbar.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/data/models/techmodels/acceptedorders.dart';
import 'package:laser/app/modules/techome/views/widgets/accept_order_helper/editwidget/edit_checkbox.dart';

import '../../../controller/techomecontroller.dart';

class RemoveDialogScreen extends GetView<TecHomeController> {
  const RemoveDialogScreen({super.key, this.acceptedOrder});
  final AcceptedOrder? acceptedOrder;
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: const Color(0xFF1B1926),
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
    var shapeDecoration = ShapeDecoration(
      color: const Color(0xFF1B1D28),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
    var textStyle2 = TextStyle(
      color: Colors.white,
      fontSize: 12.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
    var textStyle3 = TextStyle(
      color: Colors.white,
      fontSize: 12.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Dialog(
          child: Container(
            width: 319.w,
            height: 419.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                EditCheckboxWidget(
                  textStyle: textStyle,
                  ishold: false,
                ),
                SizedBox(
                  height: 47.h,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 26.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.editOrder.value) {
                          //Todo Update Order
                        } else if (controller.holdOrderType.value) {
                          controller.holdOrder(
                              orderId: acceptedOrder!.orderId,
                              lang: LocalizationService.isItEnglish()
                                  ? 'en'
                                  : 'ar');
                        } else {
                          CustomSnackBar.showCustomErrorSnackBar(
                            title: 'Error',
                            message: 'Please select at least one option',
                          );
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 106.w,
                        height: 25.h,
                        decoration: shapeDecoration,
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: textStyle2,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 70.w,
                        height: 25.h,
                        alignment: Alignment.center,
                        decoration: shapeDecoration,
                        child: Text(
                          'Back',
                          textAlign: TextAlign.center,
                          style: textStyle3,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 26.w,
                    ),
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
