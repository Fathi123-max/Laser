import 'package:flutter/material.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class BackBut extends StatelessWidget {
  const BackBut({
    super.key,
    this.OnTap,
  });

  final void Function()? OnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Text('Back',
          textAlign: TextAlign.center, style: MyStyles().fontSize12Weight700),
    );
  }
}
