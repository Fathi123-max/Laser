import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/techome/controller/techomecontroller.dart';
import 'package:laser/app/modules/techome/views/widgets/accept_order_helper/edit_remove_widget/edit_custom_dialog.dart';

class EditRemoveCheckboxWidget extends GetView<TecHomeController> {
  final bool? ishold;

  const EditRemoveCheckboxWidget({
    super.key,
    this.ishold,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 250.w,
          child: Text(
            'Please enter customer’s\ncode to edit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF1B1926),
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 34.h,
        ),
        RemoveEditCustomDialogFiled(
          isRigter: ishold ?? false,
          keyboardType: TextInputType.number,
          hint: "1234",
        )
      ],
    );
  }
}
