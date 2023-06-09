import 'package:flutter/material.dart';

import '../../Utils/snackbar.dart';
import '../../routes/AppRoutes/approutes.dart';
import '../boarding/components/googlebutton.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Account',
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
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;
                if (email.isEmpty) {
                  return;
                }
                if (password.isEmpty) {
                  return;
                }
                // Perform account login logic here
                final user = await auth.LoginUsingEmail(
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
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
