import 'package:ecommerse_app_persional/authentication_screen/boarding/splashScreen.dart';
import 'package:flutter/material.dart';

import '../../authentication_screen/boarding/onboardingScreen.dart';
import '../../authentication_screen/boarding/signupscreen.dart';

class AppRoutes {
  // Route names
  static const String splashscreen = '/';
  static const String onboardingScreen = '/myRoute';
  static const String onSignUpScreen = '/signUp';

  // Generate route function
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case onSignUpScreen:
        return MaterialPageRoute(builder: (_) => const OnSignUpScreen());
      default:
        return null;
    }
  }

  static navigateToNextScreen(BuildContext context, String name) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, name);
    });
  }
}
