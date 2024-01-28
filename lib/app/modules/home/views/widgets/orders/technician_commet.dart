import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class TechnicianCommet extends StatelessWidget {
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
            Text('Extra fees was added to clean the camera screen',
                textAlign: TextAlign.center,
                style: MyStyles().fontSize12Weight400),
          ],
        )
      ],
    );
  }
}
