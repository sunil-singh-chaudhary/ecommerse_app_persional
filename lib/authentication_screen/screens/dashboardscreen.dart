import 'package:ecommerse_app_persional/Utils/signout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../boarding/components/googlebutton.dart';
import 'onboardingScreen.dart';

SignOutProvider signout = SignOutProvider();

class DashBoardScreen extends StatefulWidget {
  String? email;

  DashBoardScreen({super.key, required this.email});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SignIn Screen',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the desired color here
        ),
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
      body: SizedBox(
        child: Center(
          child: Text("${widget.email}"),
        ),
      ),
    );
  }
}
