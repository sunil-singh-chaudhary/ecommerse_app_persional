import 'package:flutter/material.dart';

import '../../authentication_screen/screens/LoginScreen.dart';
import '../../authentication_screen/screens/dashboardscreen.dart';
import '../../authentication_screen/screens/onboardingScreen.dart';
import '../../authentication_screen/screens/signupscreen.dart';
import '../../authentication_screen/screens/splashScreen.dart';

class AppRoutes {
  // Route names
  static const String splashscreen = '/';
  static const String onloginScreen = '/onloginscreen';
  static const String onboardingScreen = '/myRoute';
  static const String onSignUpScreen = '/signUp';
  static const String ondashboardscreem = '/Dashboardscreen';

  // Generate route function
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onloginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case onSignUpScreen:
        return MaterialPageRoute(builder: (_) => OnSignUpScreen());
      case ondashboardscreem:
        return MaterialPageRoute(
            builder: (_) => DashBoardScreen(email: args as String));
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
