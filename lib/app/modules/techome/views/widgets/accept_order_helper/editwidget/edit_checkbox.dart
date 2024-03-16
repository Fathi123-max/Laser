import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/techome/controller/techomecontroller.dart';
import 'package:laser/app/modules/techome/views/widgets/accept_order_helper/editwidget/edit_custom_dialog.dart';

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
        value: controller.editOrder.value,
        onChanged: (value) {
          controller.editOrder.value = value!;
          controller.holdOrderType.value = !value;
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
              child: Text(
                'Please enter customer’s\ncode to edit',
                style: TextStyle(
                  color: Color(0xFF1B1926),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            EditCustomDialogFiled(
              isRigter: ishold ?? false,
              keyboardType: TextInputType.number,
              hint: "1234",
            )
          ],
        ),
      );
    });
  }
}
