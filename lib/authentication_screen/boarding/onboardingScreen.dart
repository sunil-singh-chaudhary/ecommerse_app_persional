import 'package:ecommerse_app_persional/authentication_screen/boarding/components/applebutton.dart';
import 'package:ecommerse_app_persional/authentication_screen/boarding/components/facebookbutton.dart';
import 'package:ecommerse_app_persional/authentication_screen/boarding/components/googlebutton.dart';
import 'package:ecommerse_app_persional/routes/translate/app_localization.dart';
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
              Text(
                AppLocalizations.of(context).getTranslate('title1') ??
                    "error trns",
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Gotham",
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalizations.of(context).getTranslate('title2') ??
                    "error trns",
                style: const TextStyle(
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
              SizedBox(
                height: 1.h,
              ),
              const FaceBookButton(),
              SizedBox(
                height: 1.h,
              ),
              const AppleButton(),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () => print("click login"),
                child: Text(
                  AppLocalizations.of(context).getTranslate('login') ??
                      "ERror login",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Gotham",
                      fontWeight: FontWeight.normal,
                      fontSize: 15.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
