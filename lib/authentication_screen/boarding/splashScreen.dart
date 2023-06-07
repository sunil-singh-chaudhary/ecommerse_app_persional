import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
    AppRoutes.navigateToNextScreen(context, AppRoutes.onboardingScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white60,
        child: Center(
          child: Image.asset(
            'assets/files/app_logo.png',
            fit: BoxFit.cover,
            height: 25.h,
            width: 25.h,
          ),
        ),
      ),
    );
  }
}
