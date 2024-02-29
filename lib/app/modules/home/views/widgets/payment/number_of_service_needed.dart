import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

class NumberOfServiceNeeded extends GetView<HomeController> {
  const NumberOfServiceNeeded({
    super.key,
    this.counter,
  });
  final int? counter;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(35),
        Text("Number of services needed",
            style: MyStyles().fontSize12Weight700),
        const Spacer(),
        Text(counter.toString(), style: MyStyles().fontSize12Weight400),
        const Gap(28)
      ],
    );
  }
}
