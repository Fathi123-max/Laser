import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';
import 'package:laser/app/modules/home/views/widgets/custom_expandtile_widget.dart';
import 'package:laser/app/modules/home/views/widgets/device_brand_widget.dart';
import 'package:laser/app/modules/home/views/widgets/page_banner.dart';

class DeviceBrandPage extends StatelessWidget {
  const DeviceBrandPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Gap(30),
          PageBanner(
              pageIndex: 1,
              pageTitle: "Device Type",
              pageSubTitle: "Select your device type"),
          Gap(20),
          DeviceBrandWidget(),
          Gap(25),
          CustomExpandtileWidget(),
          CustomDivider(),
          CustomExpandtileWidget(),
          CustomDivider(),
        ],
      ),
    );
  }
}
