import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

class TechnicianVisitStatus extends GetView<HomeController> {
  const TechnicianVisitStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("/---------------------------------------------------/");
    print(controller.orderDetailsModel.techVisitStatus);
    print("/---------------------------------------------------/");

    return Container(
        width: 300.w,
        height: 365.h,
        decoration: MyStyles().shapeDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(23),
            Row(
              children: [
                const Gap(24),
                Text(
                  'Technician Visit Status',
                  textAlign: TextAlign.center,
                  style: MyStyles().languageButtonStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                )
              ],
            ),
            const Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150.w,
                  child: Stepper(
                      stepIconBuilder: (stepIndex, stepState) {
                        if (stepState == StepState.editing) {
                          return Container(
                            color: Colors.white,
                            child: AssetImageView(
                              height: 25.h,
                              width: 31.w,
                              fileName: "done.png",
                              // color: Colors.transparent,
                            ),
                          );
                        } else if (stepState == StepState.error) {
                        } else if (stepState == StepState.indexed) {
                          return Container(
                            width: 22.w,
                            height: 22.h,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFDCDCDC),
                              shape: OvalBorder(),
                            ),
                          );
                        } else if (stepState == StepState.complete) {
                          return Container(
                            color: Colors.white,
                            child: AssetImageView(
                              height: 25.h,
                              width: 31.w,
                              fileName: "done.png",
                              // color: Colors.transparent,
                            ),
                          );
                        } else {}
                      },
                      steps: [
                        Step(
                            state:
                                controller.orderDetailsModel.techVisitStatus ==
                                            "Requested" ||
                                        controller.orderDetailsModel
                                                .techVisitStatus ==
                                            "Completed" ||
                                        controller.orderDetailsModel
                                                .techVisitStatus ==
                                            "Driver on the way"
                                    ? StepState.complete
                                    : StepState.indexed,
                            title: Text('Requested',
                                style: MyStyles().fontSize12Weight400),
                            content: const Text(""),
                            isActive: true),
                        Step(
                            state:
                                controller.orderDetailsModel.techVisitStatus ==
                                            "Driver on the way" ||
                                        controller.orderDetailsModel
                                                .techVisitStatus ==
                                            "Completed"
                                    ? StepState.complete
                                    : StepState.indexed,
                            title: Text('Driver on the way',
                                style: MyStyles().fontSize12Weight400),
                            content: const Text(""),
                            isActive: true),
                        Step(
                            state:
                                controller.orderDetailsModel.techVisitStatus ==
                                        "Completed"
                                    ? StepState.complete
                                    : StepState.indexed,
                            title: Text('Completed',
                                style: MyStyles().fontSize12Weight400),
                            content: const Text(""),
                            isActive: false),
                      ]),
                ),
              ],
            ),
          ],
        ));
  }
}
