import 'package:ecommerse_app_persional/routes/translate/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/AppRoutes/approutes.dart';

class signUpMethod extends StatelessWidget {
  const signUpMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () => AppRoutes.navigateToNextScreen(
            //navigate to signup screen
            context,
            AppRoutes.onSignUpScreen,
            email: "no email"),
        child: Center(
            child: Text(
          AppLocalizations.of(context).getTranslate('signup_text') ??
              "trnalation error",
          style: const TextStyle(
              fontFamily: "Gotham",
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        )),
      ),
    );
  }
}
