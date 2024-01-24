import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/modules/home/views/widgets/device_type_widget.dart';
import 'package:laser/app/modules/home/views/widgets/page_banner.dart';

class DeviceTypePage extends StatelessWidget {
  const DeviceTypePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(30),
        const PageBanner(
            pageIndex: 1,
            pageTitle: "Device Type",
            pageSubTitle: "Select your device type"),
        const Gap(30),
        const Row(
          children: [
            Gap(43),
            DeviceTypeWidget(fileName: "phone.png", text: "Phone"),
            Spacer(),
            DeviceTypeWidget(fileName: "laptop.png", text: "Laptop"),
            Gap(43),
          ],
        ),
        const Gap(19),
        Row(
          children: [
            const Gap(43),
            DeviceTypeWidget(
              fileName: "watch.png",
              text: "Watch",
              onTap: () {},
            ),
            const Spacer(),
            const DeviceTypeWidget(fileName: "ipad.png", text: "iPad"),
            const Gap(43),
          ],
        ),
        const Gap(24),
        SizedBox(
          width: 273.w,
          child: Text(
            '*If you have more than one device, finish it \n one by one and you can add it after you finish the process.',
            style: TextStyle(
              color: const Color(0xFF1B1926),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Gap(25),
      ],
    );
  }
}
