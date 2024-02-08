import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/config/theme/my_theme.dart';
import 'package:laser/app/data/models/device_brand_model.dart';
import 'package:laser/app/data/models/device_model.dart';
import 'package:laser/app/data/models/device_type_model.dart';
import 'package:laser/app/data/models/payload.dart';
import 'package:laser/app/data/models/register_response.dart';
import 'package:laser/app/data/models/service_model.dart';
import 'package:laser/app/data/models/user.dart';
import 'package:laser/app/modules/Auth/binding/text_form_field_biniding.dart';
import 'package:laser/app/utils/awesome_notifications_helper.dart';

import 'app/config/translations/localization_service.dart';
import 'app/data/local/my_hive.dart';
import 'app/data/local/my_shared_pref.dart';
import 'app/data/models/user_model.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/fcm_helper.dart';

Future<void> main() async {
  // wait for bindings
  WidgetsFlutterBinding.ensureInitialized();

  // initialize local db (hive) and register our custom adapters
  await MyHive.init(registerAdapters: (hive) {
    hive.registerAdapter(UserModelAdapter());
    hive.registerAdapter(PayloadAdapter());
    hive.registerAdapter(UserAdapter());
    hive.registerAdapter(RegisterResponseAdapter());
    hive.registerAdapter(DeviceBrandModelAdapter());
    hive.registerAdapter(DeviceTypeAdapter());
    hive.registerAdapter(DeviceModelAdapter());
    hive.registerAdapter(ServiceAdapter());

    // hive.registerAdapter(DeviceTypeAdapter());

    //myHive.registerAdapter(OtherAdapter());
  });

  // init shared preference
  await MySharedPref.init();

  // inti fcm services
  await FcmHelper.initFcm();

  // initialize local notifications service
  await AwesomeNotificationsHelper.init();
  runApp(
    DevicePreview(
      // enabled: !kReleaseMode, // Disable it in release builds.
      builder: (context) => ScreenUtilInit(
        // todo add your (Xd / Figma) artboard size
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        builder: (context, widget) {
          return GetMaterialApp(
            // builder: DevicePreview.appBuilder, // Add the builder here
            // locale: DevicePreview.locale(context), // Add the locale here
            initialBinding: TextFormFieldBinding(),
            title: "ليزر",
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            // initialBinding: SplashScreenBinding(),
            builder: (context, widget) {
              bool themeIsLight = MySharedPref.getThemeIsLight();
              return Theme(
                // data: MyTheme.getThemeData(isLight: !themeIsLight),
                data: MyTheme.getThemeData(isLight: !themeIsLight),
                child: MediaQuery(
                  // prevent font from scalling (some people use big/small device fonts)
                  // but we want our app font to still the same and dont get affected
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: widget!,
                ),
              );
            },
            defaultTransition: Transition.cupertino,
            initialRoute:
                AppPages.iNITIAL, // first screen to show when app is running
            getPages: AppPages.routes, // app screens
            locale: MySharedPref.getCurrentLocal(), // app language
            translations: LocalizationService
                .getInstance(), // localization services in app (controller app language)
          );
        },
      ),
    ),
  );
}
