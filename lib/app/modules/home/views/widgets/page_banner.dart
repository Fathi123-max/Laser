import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PageBanner extends StatelessWidget {
  const PageBanner({
    Key? key,
    required this.pageIndex,
    required this.pageTitle,
    required this.pageSubTitle,
  }) : super(key: key);
  final int pageIndex;
  final String pageTitle;
  final String pageSubTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
            height: 141.h,
            width: 325.w,
            decoration: ShapeDecoration(
                color: const Color(0xFF1B1D28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(20),
                Container(
                  width: 35.w,
                  height: 35.w,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1B1D28),
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.white.withOpacity(0.20000000298023224),
                      ),
                    ),
                  ),
                  child: Text(
                    pageIndex.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Gap(32),
                SizedBox(
                  width: 124.w,
                  height: 23.h,
                  child: AutoSizeText(
                    pageTitle.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      // height: 0.05,
                    ),
                  ),
                ),
                const Gap(7),
                Text(
                  pageSubTitle.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF908DA9),
                    fontSize: 11.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.17,
                  ),
                ),
                const Gap(26)
              ],
            )),
        const Spacer(),
      ],
    );
  }
}
