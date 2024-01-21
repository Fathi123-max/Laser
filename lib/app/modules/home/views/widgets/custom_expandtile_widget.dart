import 'package:flutter/material.dart';
import 'package:laser/app/modules/home/views/widgets/dropdown2.dart';

class CustomExpandtileWidget extends StatelessWidget {
  const CustomExpandtileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton2(
      value: "true",
      dropdownItems: [],
      hint: "",
      onChanged: (value) {},
    );
  }
}




/**ExpansionTile(
      trailing: Icon(Icons.arrow_drop_down, size: 25.sp),
      collapsedBackgroundColor:
          MyTheme.getThemeData(isLight: true).scaffoldBackgroundColor,
      collapsedIconColor: Colors.black,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(30.r))),
      title: Text(
        'Device Model',
        style: TextStyle(
          color: const Color(0xFF1B1926),
          fontSize: 12.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
      ),
      children: const [
        ListTile(
          title: Text(
            'Model 1',
            style: TextStyle(
              color: Color(0xFF1B1926),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: Text('Model 2'),
        ),
        ListTile(
          title: Text('Model 3'),
        ),
      ],
    );
   */