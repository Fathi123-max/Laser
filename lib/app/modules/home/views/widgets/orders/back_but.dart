import 'package:flutter/material.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class BackBut extends StatelessWidget {
  const BackBut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text('Back',
          textAlign: TextAlign.center, style: MyStyles().fontSize12Weight700),
    );
  }
}
