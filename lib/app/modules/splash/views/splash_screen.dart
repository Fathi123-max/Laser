import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laser/app/modules/home/views/home_view.dart';
import 'package:laser/app/modules/onboarding/view/onboarding_screens.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoaded = false;
  GetStorage prefs = GetStorage();
  var onboarding;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      onboarding = await prefs.read("onboarding");

      Future.delayed(const Duration(seconds: 6)).then((value) => setState(() {
            isLoaded = true;
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(onboarding);
    return SplashScreenView(
      navigateWhere: isLoaded,
      navigateRoute: onboarding == null ? OnboardingScreens() : HomeView(),
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
      logoSize: MediaQuery.of(context).size.height,
      imageSrc: "assets/images/splashscreen.png",
    );
  }
}
