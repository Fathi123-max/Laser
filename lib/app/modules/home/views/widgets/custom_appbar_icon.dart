import 'package:flutter/material.dart';
import 'package:laser/app/components/custom_image_widget.dart';

class CustomAppbarIcon extends StatelessWidget {
  const CustomAppbarIcon({
    super.key,
    this.onTap,
    this.fileName,
    this.height,
    this.width,
  });
  final Function()? onTap;
  final String? fileName;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AssetImageView(
        fileName: fileName ?? "logo.png",
        height: height,
        width: width,
      ),
    );
  }
}
