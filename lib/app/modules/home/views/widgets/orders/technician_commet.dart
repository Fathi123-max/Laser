import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_styles.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

class TechnicianCommet extends GetView<HomeController> {
  const TechnicianCommet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Gap(18),
            Text('Technician Comment:',
                textAlign: TextAlign.center,
                style: MyStyles().fontSize12Weight700),
          ],
        ),
        Row(
          children: [
            const Gap(18),
            Text(controller.techComments.value,
                textAlign: TextAlign.center,
                style: MyStyles().fontSize12Weight400),
          ],
        )
      ],
    );
  }
}
