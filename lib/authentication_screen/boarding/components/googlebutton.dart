import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
        onTap: () => print('Continue with google'),
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
              child: const Text(
                'Continue with Google',
                style: TextStyle(
                    fontFamily: "Gotham",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
