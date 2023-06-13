import 'package:ecommerse_app_persional/authentication_screen/boarding/splashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../authentication_screen/boarding/onboardingScreen.dart';
import '../../authentication_screen/boarding/signupscreen.dart';
import '../../authentication_screen/screens/loginscreen.dart';

class AppRoutes {
  // Route names
  static const String splashscreen = '/';
  static const String onboardingScreen = '/myRoute';
  static const String onSignUpScreen = '/signUp';
  static const String onLoginsuccess = '/LoginScreen';

  // Generate route function
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case onSignUpScreen:
        return MaterialPageRoute(builder: (_) => const OnSignUpScreen());
      case onLoginsuccess:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(email: args as String));
      default:
        return null;
    }
  }

  static navigateToNextScreen(BuildContext context, String name,
      {required email}) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, name, arguments: email);
    });
  }

  static navigateAndDontRepeat(BuildContext context, String name) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, name, (Route<dynamic> route) => false);
    });
  }
}
