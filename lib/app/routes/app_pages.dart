import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:laser/app/modules/onboarding/binding/onboarding_binding.dart';
import 'package:laser/app/modules/onboarding/view/onboarding_screens.dart';
import 'package:laser/app/modules/splash/biniding/splash_screen_binding.dart';
import 'package:laser/app/modules/splash/views/splash_Screen.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const iNITIAL = Routes.Splash;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: Routes.Splash,
        page: () => const SplashScreen(),
        binding: SplashScreenBinding()),
    GetPage(
        name: Routes.Onboarding,
        page: () => const OnboardingScreens(),
        binding: OnboardingBinding()),
  ];
}
