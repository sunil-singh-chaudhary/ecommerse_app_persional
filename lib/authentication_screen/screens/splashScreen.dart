import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/AppRoutes/approutes.dart';
import 'dashboardscreen.dart';

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
        body: Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/files/app_logo.png', // Replace with the correct image path
            fit: BoxFit.cover, // Replace with the desired fit option
            height: 200, // Replace with the desired height
            width: 200, // Replace with the desired width
          ),
        ),
        FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              SharedPreferences _prefs = snapshot.data!;
              print(_prefs.getBool('isLogin'));
              bool? isLogin = _prefs.getBool('isLogin') ?? false;
              String? isemail = _prefs.getString('isemail') ?? "";
              print(_prefs.getString('isemail'));

              if (isLogin) {
                return DashBoardScreen(email: isemail);
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  AppRoutes.navigateAndDontRepeat(
                      context, AppRoutes.onboardingScreen);
                });
              }
            }

            // `_prefs` is not ready yet, show loading bar till then.
            return Center(child: const CircularProgressIndicator());
          },
        ),
      ],
    ));
  }
}
