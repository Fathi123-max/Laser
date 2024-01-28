import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class NumberOfServiceNeeded extends StatelessWidget {
  const NumberOfServiceNeeded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(35),
        Text("Number of services needed",
            style: MyStyles().fontSize12Weight700),
        const Spacer(),
        Text("3", style: MyStyles().fontSize12Weight400),
        const Gap(28)
      ],
    );
  }
}
