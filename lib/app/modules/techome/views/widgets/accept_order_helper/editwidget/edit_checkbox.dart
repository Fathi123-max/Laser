import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/techome/controller/techomecontroller.dart';

class EditCheckboxWidget extends GetView<TecHomeController> {
  final bool? ishold;

  const EditCheckboxWidget({
    super.key,
    required this.textStyle,
    this.ishold,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CheckboxListTile.adaptive(
        value: controller.holdOrderType.value,
        onChanged: (value) {
          controller.holdOrderType.value = value!;
          controller.editOrder.value = !value;
        },
        activeColor: const Color(0xFF1B1926),
        // Change the inactive color here
        checkboxShape: const CircleBorder(),
        controlAffinity: ListTileControlAffinity.leading,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 250.w,
              height: 40.h,
              child: Text.rich(
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
              ),
            ),
            EditCheckboxWidget(
              textStyle: textStyle,
            )
          ],
        ),
      );
    });
  }
}
