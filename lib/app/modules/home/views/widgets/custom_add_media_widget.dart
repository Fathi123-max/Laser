import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laser/app/modules/home/views/widgets/device_type_widget.dart';

class CustomAddMediaWidget extends StatelessWidget {
  const CustomAddMediaWidget({
    Key? key,
    required this.photoName,
  }) : super(key: key);
  final String photoName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DeviceTypeWidget(
          fileName: photoName,
          height: 75.h,
          width: 90.w,
          enableMargin: true,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 20.w,
            child: Icon(
              Icons.add,
              size: 15.w,
              color: Colors.white,
            ),
            height: 20.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black, // Replace with your desired color
            ),
          ),
        ),
      ],
    );
  }
}
