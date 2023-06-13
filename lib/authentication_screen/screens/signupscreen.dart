import 'package:ecommerse_app_persional/authentication_screen/boarding/components/googlebutton.dart';
import 'package:ecommerse_app_persional/routes/AppRoutes/approutes.dart';
import 'package:flutter/material.dart';

import '../../Utils/auth.dart';
import '../../Utils/snackbar.dart';

class OnSignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the desired color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;
                String name = nameController.text;
                if (email.isEmpty) {
                  return;
                }
                if (password.isEmpty) {
                  return;
                }
                // Perform account creation logic here
                final user = await auth.registerUser(
                    emailAddress: email, password: password);
                user.fold(
                    (l) =>
                        ShowSnackBar.showCustomSnackbar(context, l.toString()),
                    (r) {
                  AppRoutes.navigateToNextScreen(
                      context, AppRoutes.ondashboardscreem,
                      email: r!.email);
                  auth.savetoSignInPref(r.email); //save to shared logininfo
                });

                // Clear the text fields
                emailController.clear();
                passwordController.clear();
                nameController.clear();
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
