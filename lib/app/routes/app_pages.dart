import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:laser/app/modules/Auth/binding/auth_binding.dart';
import 'package:laser/app/modules/Auth/binding/login_binding.dart';
import 'package:laser/app/modules/Auth/view/screens/login_screen.dart';
import 'package:laser/app/modules/Auth/view/widgets/model_layout.dart';
import 'package:laser/app/modules/language/binding/language_binding.dart';
import 'package:laser/app/modules/language/view/language_screen.dart';
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
    GetPage(
        name: Routes.Language,
        page: () => LanguagePage(),
        binding: LanguageBinding()),
    GetPage(
      name: Routes.AuthModelPage,
      page: () => const AuthModelPage(
        authContant: null,
      ),
      binding: AuthModelPageBinding(),
    ),
    GetPage(
        name: Routes.LoginPage,
        page: () => LoginPage(),
        binding: LoginBinding()),
    // GetPage(name: Routes.RegisterPage, page:()=> Registerpage(), binding:MyBinding() ),
  ];
}
