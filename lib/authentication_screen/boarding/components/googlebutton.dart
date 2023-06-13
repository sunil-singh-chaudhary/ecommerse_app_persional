import 'package:ecommerse_app_persional/Utils/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/AppRoutes/approutes.dart';
import '../../../routes/translate/app_localization.dart';

Auth auth = Auth();

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 80.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1)),
      child: InkWell(
        onTap: () async {
          User? users = await auth.googleButtonSignIn();
          print(users!.email);
          if (users.email != null) {
            AppRoutes.navigateToNextScreen(context, AppRoutes.onLoginsuccess,
                email: users.email);
          }
        },
        child: Row(
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
                AppLocalizations.of(context).getTranslate('signup_google') ??
                    "trnalation error",
                style: const TextStyle(
                    fontFamily: "Gotham",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
