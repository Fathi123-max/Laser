import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:laser/app/binding/on_start_binding.dart';
import 'package:laser/app/modules/Auth/binding/auth_binding.dart';
import 'package:laser/app/modules/Auth/binding/forget_password_binding.dart';
import 'package:laser/app/modules/Auth/binding/login_binding.dart';
import 'package:laser/app/modules/Auth/binding/new_password_binding.dart';
import 'package:laser/app/modules/Auth/binding/otp_binding.dart';
import 'package:laser/app/modules/Auth/binding/register_binding.dart';
import 'package:laser/app/modules/Auth/view/screens/forgot_password_screen.dart';
import 'package:laser/app/modules/Auth/view/screens/login_screen.dart';
import 'package:laser/app/modules/Auth/view/screens/new_password_screen.dart';
import 'package:laser/app/modules/Auth/view/screens/otp_screen.dart';
import 'package:laser/app/modules/Auth/view/screens/register_screen.dart';
import 'package:laser/app/modules/Auth/view/widgets/model_layout.dart';
import 'package:laser/app/modules/language/binding/language_binding.dart';
import 'package:laser/app/modules/language/view/language_screen.dart';
import 'package:laser/app/modules/onboarding/binding/onboarding_binding.dart';
import 'package:laser/app/modules/onboarding/view/onboarding_screens.dart';
import 'package:laser/app/modules/splash/views/splash_Screen.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/screens/home_screen.dart';

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
        binding: OnStartBinding()),
    GetPage(
        name: Routes.Onboarding,
        page: () => const OnboardingScreens(),
        binding: OnboardingBinding()),
    GetPage(
        name: Routes.Language,
        page: () => const LanguagePage(),
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
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.RegisterPage,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: Routes.ForgotPasswordlPage,
        page: () => const ForgotPage(),
        binding: ForgotBinding()),
    GetPage(
        name: Routes.OtpPage,
        page: () => const OtpPage(),
        binding: OtpBinding()),
    GetPage(
        name: Routes.NewPassword,
        page: () => const NewPassword(),
        binding: NewPasswordBinding()),
  ];
}
