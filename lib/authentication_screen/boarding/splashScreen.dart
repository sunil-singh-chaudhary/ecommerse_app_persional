import 'package:ecommerse_app_persional/Utils/snackbar.dart';
import 'package:ecommerse_app_persional/authentication_screen/boarding/onboardingScreen.dart';
import 'package:ecommerse_app_persional/authentication_screen/screens/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/AppRoutes/approutes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // AppRoutes.navigateAndDontRepeat(context, AppRoutes.onboardingScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SharedPreferences _prefs = snapshot.data!;
            print(_prefs.getBool('isLogin'));
            bool? isLogin = _prefs.getBool('isLogin') ?? false;
            String? isemail = _prefs.getString('isemail') ?? "";
            print(_prefs.getString('isemail'));
            return isLogin
                ? LoginScreen(email: isemail)
                : const OnBoardingScreen();
          }

          // `_prefs` is not ready yet, show loading bar till then.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
