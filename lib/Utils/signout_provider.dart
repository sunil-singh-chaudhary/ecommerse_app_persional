import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutProvider extends ChangeNotifier {
  bool _isSigningOut = false;

  bool get isSigningOut => _isSigningOut;

  Future<void> signOut() async {
    _isSigningOut = true;

    notifyListeners();

    // Perform the sign-out operation
    try {
      await FirebaseAuth.instance.signOut();
      print('User signed out successfully');
    } catch (e) {
      print('Error signing out: $e');
    }

    _isSigningOut = false;
    notifyListeners();
  }
}
