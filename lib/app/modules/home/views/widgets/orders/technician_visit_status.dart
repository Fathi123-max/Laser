import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/components/custom_image_widget.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class TechnicianVisitStatus extends StatelessWidget {
  const TechnicianVisitStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.w,
        height: 365.h,
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
                            state: StepState.complete,
                            title: Text('Requested',
                                style: MyStyles().languageButtonStyle.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400)),
                            content: const Text(""),
                            isActive: true),
                        Step(
                            state: StepState.indexed,
                            title: Text('Requested',
                                style: MyStyles().languageButtonStyle.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400)),
                            content: const Text(""),
                            isActive: false),
                        Step(
                            state: StepState.indexed,
                            title: Text('Requested',
                                style: MyStyles().fontSize12Weight400),
                            content: const Text(""),
                            isActive: false),
                      ]),
                ),
              ],
            ),
          ],
        ),
        decoration: MyStyles().shapeDecoration);
  }
}
