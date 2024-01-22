import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laser/app/config/theme/my_theme.dart';
import 'package:laser/app/modules/home/views/widgets/custom_divider.dart';

class CustomExpandtileWidget extends StatelessWidget {
  const CustomExpandtileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedTile(
        contentseparator: 1,
        trailing: Icon(Icons.arrow_drop_down_rounded, size: 25.sp),
        theme: ExpandedTileThemeData(
          headerPadding: EdgeInsets.fromLTRB(25.w, 20.h, 25.w, 15.h),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 40.w,
          ),
          contentRadius: 13.r,
          contentBackgroundColor:
              MyTheme.getThemeData(isLight: true).scaffoldBackgroundColor,
          headerColor:
              MyTheme.getThemeData(isLight: true).scaffoldBackgroundColor,
          headerSplashColor:
              MyTheme.getThemeData(isLight: true).scaffoldBackgroundColor,
        ),
        trailingRotation: 1,
        title: Text('Device Model',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            )),
        content: Container(
          alignment: Alignment.topCenter,
          width: 311.w,
          height: 169.h,
          child: Stack(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const CustomDivider();
                  },
                  itemCount: 2,
                  padding: EdgeInsets.all(10.h),
                  primary: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 38.h,
                      alignment: Alignment.center,
                      child: Row(children: [
                        const Gap(23),
                        Text(
                          'iphone 11',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            // height: 0.20,
                          ),
                        ),
                        const Gap(15),
                        Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                Colors.red, // Replace with your desired color
                          ),
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            value: true,
                            activeColor: Colors.black,
                            checkColor: Colors.white,
                            // Add this line to set the disabled color to grey

                            shape: const CircleBorder(),
                            onChanged: (value) {},
                          ),
                        ),
                      ]),
                    );
                  }),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 50.w,
                  ))
            ],
          ),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x02000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 1,
              )
            ],
          ),
        ),
        controller: ExpandedTileController(isExpanded: true));
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
