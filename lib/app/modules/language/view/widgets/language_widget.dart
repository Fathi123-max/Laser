import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laser/app/config/theme/my_styles.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    Key? key,
    this.onTap,
    this.lang,
  }) : super(key: key);
  final Function()? onTap;
  final String? lang;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 98.w,
          height: 101.h,
          alignment: Alignment.center,
          child: // Figma Flutter Generator ArWidget - TEXT
              Text(lang ?? 'AR',
                  textAlign: TextAlign.center,
                  style: MyStyles().languageButtonStyle),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(152, 152, 152, 0.009999999776482582),
                  offset: Offset(0, 4),
                  blurRadius: 4)
            ],
            color: const Color.fromRGBO(255, 255, 255, 1),
          )),
    );
  }
}
