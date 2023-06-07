import 'package:flutter/material.dart';

class OnSignUpScreen extends StatefulWidget {
  const OnSignUpScreen({super.key});

  @override
  State<OnSignUpScreen> createState() => _OnSignUpScreenState();
}

class _OnSignUpScreenState extends State<OnSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}
