import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/data/models/techmodels/acceptedorders.dart';
import 'package:laser/app/modules/techome/views/widgets/accept_order_helper/edit_remove_widget/editcheckout.dart';

import '../../../controller/techomecontroller.dart';

class RemoveDialogScreen extends GetView<TecHomeController> {
  const RemoveDialogScreen({super.key, this.acceptedOrder, this.index});
  final AcceptedOrder? acceptedOrder;
  final int? index;
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
            height: 370.h,
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
                AssetImageView(
                  fileName: "lock.png",
                  height: 77.h,
                  width: 77.w,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const EditRemoveCheckboxWidget(
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
                        if (acceptedOrder!.services![index!].serviceId !=
                            null) {
                          controller.removeService(
                              orderCode:
                                  controller.removeEditingController.value.text,
                              services: acceptedOrder!.services!,
                              index: index!,
                              serviceId:
                                  acceptedOrder!.services![index!].serviceId!,
                              orderId: acceptedOrder!.orderId,
                              lang: LocalizationService.isItEnglish()
                                  ? 'en'
                                  : 'ar');
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
