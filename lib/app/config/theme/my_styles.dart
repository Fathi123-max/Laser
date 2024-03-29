import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laser/app/config/theme/theme_extensions/header_container_theme_data.dart';

import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_fonts.dart';
import 'theme_extensions/employee_list_item_theme_data.dart';

class MyStyles {
//////////////////////////////////////
  ///Shap Decouration For Container
//////////////////////////////////////

  ShapeDecoration shapeDecoration = ShapeDecoration(
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
  );
///////////////////////////////////////////////
  ///////////////////////////////////
  ///  fontSize12 //////////
  ///////////////////////////////////

  TextStyle fontSize12Weight700 = TextStyle(
    fontFamily: 'Inter',
    color: const Color.fromRGBO(0, 0, 0, 1),
    fontSize: 12.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );
  TextStyle fontSize12Weight400 = TextStyle(
    fontFamily: 'Inter',
    color: const Color.fromRGBO(0, 0, 0, 1),
    fontSize: 12.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );
  TextStyle fontSize12Weight500 = TextStyle(
    fontFamily: 'Inter',
    color: const Color.fromRGBO(0, 0, 0, 1),
    fontSize: 12.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );
  TextStyle fontSize12WeightBold = TextStyle(
    fontFamily: 'Inter',
    color: const Color.fromRGBO(0, 0, 0, 1),
    fontSize: 12.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.bold,
  );
////////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////////
  ///  fontSize14 //////////
  ///////////////////////////////////

  TextStyle fontSize14Weight700 = TextStyle(
    fontFamily: 'Inter',
    color: const Color.fromRGBO(0, 0, 0, 1),
    fontSize: 14.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );
  TextStyle fontSize14Weight400 = TextStyle(
    fontFamily: 'Inter',
    color: const Color.fromRGBO(0, 0, 0, 1),
    fontSize: 14.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );
  TextStyle fontSize14Weight500 = TextStyle(
    fontFamily: 'Inter',
    color: const Color.fromRGBO(0, 0, 0, 1),
    fontSize: 14.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );
  TextStyle fontSize14WeightBold = TextStyle(
    fontFamily: 'Inter',
    color: const Color.fromRGBO(0, 0, 0, 1),
    fontSize: 14.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.bold,
  );
////////////////////////////////////////////////////////////////////////////////
  TextStyle authBigTextStyle = TextStyle(
      color: const Color.fromRGBO(0, 0, 0, 1),
      fontFamily: 'Inter',
      fontSize: 20.sp,
      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
      fontWeight: FontWeight.bold,
      height: 1);
  TextStyle onBordingTextStyle = TextStyle(
    color: const Color(0xFF908DA9),
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  TextStyle onBordingButtonStyle = TextStyle(
    color: Colors.white,
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 0,
  );
  TextStyle languageButtonStyle = TextStyle(
    fontFamily: 'Inter',
    color: const Color.fromRGBO(0, 0, 0, 1),
    fontSize: 32.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.bold,
  );

  /// custom employee list item theme
  static EmployeeListItemThemeData getEmployeeListItemTheme(
      {required bool isLightTheme}) {
    return EmployeeListItemThemeData(
      backgroundColor: isLightTheme
          ? LightThemeColors.employeeListItemBackgroundColor
          : DarkThemeColors.employeeListItemBackgroundColor,
      iconTheme: IconThemeData(
        color: isLightTheme
            ? LightThemeColors.employeeListItemIconsColor
            : DarkThemeColors.employeeListItemIconsColor,
      ),
      nameTextStyle: MyFonts.bodyTextStyle.copyWith(
        fontSize: MyFonts.employeeListItemNameSize,
        fontWeight: FontWeight.bold,
        color: isLightTheme
            ? LightThemeColors.employeeListItemNameColor
            : DarkThemeColors.employeeListItemNameColor,
      ),
      subtitleTextStyle: MyFonts.bodyTextStyle.copyWith(
        fontSize: MyFonts.employeeListItemSubtitleSize,
        fontWeight: FontWeight.normal,
        color: isLightTheme
            ? LightThemeColors.employeeListItemSubtitleColor
            : DarkThemeColors.employeeListItemSubtitleColor,
      ),
    );
  }

  /// custom header theme
  static HeaderContainerThemeData getHeaderContainerTheme(
          {required bool isLightTheme}) =>
      HeaderContainerThemeData(
          decoration: BoxDecoration(
        color: isLightTheme
            ? LightThemeColors.headerContainerBackgroundColor
            : DarkThemeColors.headerContainerBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ));

  ///icons theme
  static IconThemeData getIconTheme({required bool isLightTheme}) =>
      IconThemeData(
        color: isLightTheme
            ? LightThemeColors.iconColor
            : DarkThemeColors.iconColor,
      );

  ///app bar theme
  static AppBarTheme getAppBarTheme({required bool isLightTheme}) =>
      AppBarTheme(
        elevation: 0,
        titleTextStyle:
            getTextTheme(isLightTheme: isLightTheme).bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: MyFonts.appBarTittleSize,
                ),
        iconTheme: IconThemeData(
            color: isLightTheme
                ? LightThemeColors.appBarIconsColor
                : DarkThemeColors.appBarIconsColor),
        backgroundColor: isLightTheme
            ? LightThemeColors.appBarColor
            : DarkThemeColors.appbarColor,
      );

  ///text theme
  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
        labelLarge: MyFonts.buttonTextStyle.copyWith(
          fontSize: MyFonts.buttonTextSize,
        ),
        bodyLarge: (MyFonts.bodyTextStyle).copyWith(
          fontWeight: FontWeight.bold,
          fontSize: MyFonts.bodyLargeSize,
          color: isLightTheme
              ? LightThemeColors.bodyTextColor
              : DarkThemeColors.bodyTextColor,
        ),
        bodyMedium: (MyFonts.bodyTextStyle).copyWith(
          fontSize: MyFonts.bodyMediumSize,
          color: isLightTheme
              ? LightThemeColors.bodyTextColor
              : DarkThemeColors.bodyTextColor,
        ),
        displayLarge: (MyFonts.displayTextStyle).copyWith(
          fontSize: MyFonts.displayLargeSize,
          fontWeight: FontWeight.bold,
          color: isLightTheme
              ? LightThemeColors.displayTextColor
              : DarkThemeColors.displayTextColor,
        ),
        bodySmall: TextStyle(
            color: isLightTheme
                ? LightThemeColors.bodySmallTextColor
                : DarkThemeColors.bodySmallTextColor,
            fontSize: MyFonts.bodySmallTextSize),
        displayMedium: (MyFonts.displayTextStyle).copyWith(
            fontSize: MyFonts.displayMediumSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightThemeColors.displayTextColor
                : DarkThemeColors.displayTextColor),
        displaySmall: (MyFonts.displayTextStyle).copyWith(
          fontSize: MyFonts.displaySmallSize,
          fontWeight: FontWeight.bold,
          color: isLightTheme
              ? LightThemeColors.displayTextColor
              : DarkThemeColors.displayTextColor,
        ),
      );

  static ChipThemeData getChipTheme({required bool isLightTheme}) {
    return ChipThemeData(
      backgroundColor: isLightTheme
          ? LightThemeColors.chipBackground
          : DarkThemeColors.chipBackground,
      brightness: Brightness.light,
      labelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      secondaryLabelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      selectedColor: Colors.black,
      disabledColor: Colors.green,
      padding: const EdgeInsets.all(5),
      secondarySelectedColor: Colors.purple,
    );
  }

  ///Chips text style
  static TextStyle getChipTextStyle({required bool isLightTheme}) {
    return MyFonts.chipTextStyle.copyWith(
      fontSize: MyFonts.chipTextSize,
      color: isLightTheme
          ? LightThemeColors.chipTextColor
          : DarkThemeColors.chipTextColor,
    );
  }

  // elevated button text style
  static MaterialStateProperty<TextStyle?>? getElevatedButtonTextStyle(
      bool isLightTheme,
      {bool isBold = true,
      double? fontSize}) {
    return MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            color: isLightTheme
                ? LightThemeColors.buttonTextColor
                : DarkThemeColors.buttonTextColor,
          );
        } else if (states.contains(MaterialState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isLightTheme
                ? LightThemeColors.buttonDisabledTextColor
                : DarkThemeColors.buttonDisabledTextColor,
          );
        }
        return MyFonts.buttonTextStyle.copyWith(
          fontSize: fontSize ?? MyFonts.buttonTextSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: isLightTheme
              ? LightThemeColors.buttonTextColor
              : DarkThemeColors.buttonTextColor,
        ); // Use the component's default.
      },
    );
  }

  //elevated button theme data
  static ElevatedButtonThemeData getElevatedButtonTheme(
          {required bool isLightTheme}) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
              //side: BorderSide(color: Colors.teal, width: 2.0),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 8.h)),
          textStyle: getElevatedButtonTextStyle(isLightTheme),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return isLightTheme
                    ? LightThemeColors.buttonColor.withOpacity(0.5)
                    : DarkThemeColors.buttonColor.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return isLightTheme
                    ? LightThemeColors.buttonDisabledColor
                    : DarkThemeColors.buttonDisabledColor;
              }
              return isLightTheme
                  ? LightThemeColors.buttonColor
                  : DarkThemeColors.buttonColor; // Use the component's default.
            },
          ),
        ),
      );

  /// list tile theme data
  static ListTileThemeData getListTileThemeData({required bool isLightTheme}) {
    return ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      iconColor: isLightTheme
          ? LightThemeColors.listTileIconColor
          : DarkThemeColors.listTileIconColor,
      tileColor: isLightTheme
          ? LightThemeColors.listTileBackgroundColor
          : DarkThemeColors.listTileBackgroundColor,
      titleTextStyle: TextStyle(
        fontSize: MyFonts.listTileTitleSize,
        color: isLightTheme
            ? LightThemeColors.listTileTitleColor
            : DarkThemeColors.listTileTitleColor,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: MyFonts.listTileSubtitleSize,
        color: isLightTheme
            ? LightThemeColors.listTileSubtitleColor
            : DarkThemeColors.listTileSubtitleColor,
      ),
    );
  }
}
