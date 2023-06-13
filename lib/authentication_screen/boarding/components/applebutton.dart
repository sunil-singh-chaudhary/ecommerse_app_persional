import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/translate/app_localization.dart';

class AppleButton extends StatelessWidget {
  const AppleButton({super.key});

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
        onTap: () => print('Continue with Apple'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Image(
                image: const AssetImage('assets/files/apple.png'),
                height: 5.h,
                width: 5.h,
              ),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: Text(
                AppLocalizations.of(context).getTranslate('signup_apple') ??
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
