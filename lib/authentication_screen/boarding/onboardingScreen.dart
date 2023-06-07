import 'package:ecommerse_app_persional/authentication_screen/boarding/components/googlebutton.dart';
import 'package:ecommerse_app_persional/routes/AppRoutes/approutes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'components/singupmethod.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/files/app_logo.png',
                fit: BoxFit.cover,
                height: 15.h,
                width: 15.h,
              ),
              const Text(
                'Millions of Users ',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Gotham",
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Around the World. ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontFamily: "Gotham",
                    fontWeight: FontWeight.normal),
              ),
              const signUpMethod(),
              SizedBox(
                height: 1.h,
              ),
              const GoogleButton(),
            ],
          ),
        ),
      ),
    );
  }
}