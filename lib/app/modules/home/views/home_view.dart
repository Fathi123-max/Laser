import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/views/widgets/home_model.dart';

import '../controllers/home_controller.dart';
import 'widgets/device_type_widget.dart';
import 'widgets/page_banner.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeModel(
      child: Column(
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
      ),
    );
  }
}
