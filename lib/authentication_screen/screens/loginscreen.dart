import 'package:ecommerse_app_persional/Utils/auth.dart';
import 'package:ecommerse_app_persional/Utils/signout_provider.dart';
import 'package:ecommerse_app_persional/authentication_screen/boarding/onboardingScreen.dart';
import 'package:ecommerse_app_persional/routes/AppRoutes/approutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../boarding/components/googlebutton.dart';

SignOutProvider signout = SignOutProvider();

class LoginScreen extends StatefulWidget {
  String? email;

  LoginScreen({super.key, required this.email});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn Screen'),
        actions: [
          Consumer<SignOutProvider>(
            builder: (context, value, child) {
              return signout.isSigningOut
                  ? const CircularProgressIndicator()
                  : IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        signout.signOut();
                        auth.removeLoginDetails(); //remove save logindetails
                        print('backpress');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OnBoardingScreen(),
                            ));
                      },
                    );
            },
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text("${widget.email}"),
        ),
      ),
    );
  }
}
