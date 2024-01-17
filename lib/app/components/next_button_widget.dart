import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({
    Key? key,
    required this.onTap,
    required this.style,
  }) : super(key: key);
  final Function()? onTap;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Text('Next', style: style));
  }
}
