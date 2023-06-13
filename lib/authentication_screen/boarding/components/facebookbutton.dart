import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/translate/app_localization.dart';

// Create an instance of FacebookLogin

class FaceBookButton extends StatefulWidget {
  const FaceBookButton({super.key});

  @override
  State<FaceBookButton> createState() => _FaceBookButtonState();
}

class _FaceBookButtonState extends State<FaceBookButton> {
  @override
  void initState() {
    super.initState();
  }

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
        onTap: () {
          startFacebookLogin();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Image(
                image: const AssetImage('assets/files/facebook.webp'),
                height: 5.h,
                width: 5.h,
              ),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.only(left: 3.w), //signup_facebook
              child: Text(
                AppLocalizations.of(context).getTranslate('signup_facebook') ??
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

  void startFacebookLogin() async {
    print('facebook start login');
    // Log in
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userdata = await FacebookAuth.i.getUserData();
        print(userdata);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
