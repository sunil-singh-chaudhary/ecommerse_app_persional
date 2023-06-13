import 'package:ecommerse_app_persional/Utils/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/AppRoutes/approutes.dart';
import '../../../routes/translate/app_localization.dart';

Auth auth = Auth();

class GoogleButton extends StatefulWidget {
  const GoogleButton({Key? key});

  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool isLoading = false;

  void handleGoogleSignIn(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    User? user = await auth.googleButtonSignIn();

    setState(() {
      isLoading = false;
    });

    AppRoutes.navigateToNextScreen(context, AppRoutes.ondashboardscreem,
        email: user.email);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleGoogleSignIn(context),
      child: Container(
        height: 7.h,
        width: 80.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Image(
                    image: const AssetImage('assets/files/google.png'),
                    height: 5.h,
                    width: 5.h,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Text(
                      AppLocalizations.of(context)
                              .getTranslate('signup_google') ??
                          "translation error",
                      style: const TextStyle(
                        fontFamily: "Gotham",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (isLoading)
              const Positioned.fill(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
