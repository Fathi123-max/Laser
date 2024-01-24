import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class DliveryTimeAndDate extends StatelessWidget {
  const DliveryTimeAndDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 100.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          Row(
            children: [
              const Gap(24),
              Text('Delivery time and date',
                  textAlign: TextAlign.center,
                  style: MyStyles().languageButtonStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      )),
            ],
          ),
          const Gap(18),
          Row(
            children: [
              const Gap(24),
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
              Text('11:00 - 12:00',
                  style: MyStyles().languageButtonStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ))
            ],
          ),
          const Gap(10),
          Row(
            children: [
              const Gap(24),
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
              Text('8-1-2024',
                  style: MyStyles().languageButtonStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ))
            ],
          )
        ],
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x02000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 1,
          )
        ],
      ),
    );
  }
}