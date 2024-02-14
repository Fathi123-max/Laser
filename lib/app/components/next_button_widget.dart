import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({
    super.key,
    required this.onTap,
    required this.style,
  });
  final Function()? onTap;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Text('Next'.tr, style: style));
  }
}
