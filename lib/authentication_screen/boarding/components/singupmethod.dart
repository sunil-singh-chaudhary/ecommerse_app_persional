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
            AppRoutes.onSignUpScreen),
        child: const Center(
            child: Text(
          'Sign Up Free',
          style: TextStyle(
              fontFamily: "Gotham",
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        )),
      ),
    );
  }
}
