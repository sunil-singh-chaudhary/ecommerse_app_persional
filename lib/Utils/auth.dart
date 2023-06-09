import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef GetUserType = Future<Either<String?, User?>>;

class Auth {
  late final _user;
  late final _login;
  User? get users => _user;
  User? get login => _login;
  String sendCode = '';

  final _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final _auth = FirebaseAuth.instance;
  late final UserCredential user;

  GetUserType registerUser({emailAddress, password}) async {
    //error handling new style
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      _user = credential.user!;
      return right(_user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return left('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        return left('entered INvalid email');
      } else {
        return left(e.code);
      }
    } catch (e) {
      throw left(e.toString());
    }
  }

  GetUserType LoginUsingEmail({emailAddress, password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      _login = credential.user;
      return right(_login);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return left('Wrong password provided for that user.');
      } else if (e.code == 'wrong-password') {
        return left('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        return left('entered INvalid email');
      } else {
        return left(e.code);
      }
    } catch (e) {
      throw left(e.toString());
    }
  }

  // // Log out from Firebase
  // void signOut() async {
  //   try {
  //     await _auth.signOut();
  //   } on Exception catch (e) {
  //     print('error_singOut-->${e.toString()}');
  //   }
  // }

  Future<void> loginUsingPhonenumber(String pHno) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: pHno,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (phoneAuthCredential) async {
        await _auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        print('error is-->$error.toString()');
      },
      codeSent: (verificationId, forceResendingToken) {
        sendCode = verificationId;
        print('sendcode==> $sendCode');
      },
      codeAutoRetrievalTimeout: (verificationId) {
        sendCode = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String OTP) async {
    late var credential;
    try {
      credential = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(verificationId: sendCode, smsCode: OTP));
    } on FirebaseAuthException catch (exception) {
      print('OTP failed: ${exception.message}');
    }
    return credential.user != null ? true : false;
  }

  Future<User> googleButtonSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      user = await _auth.signInWithCredential(credential);
      savetoSignInPref(user.user!.email!);
      return user.user!;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    return user.user!;
  }

  void savetoSignInPref(String? emailsave) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
    await prefs.setString('isemail', emailsave!);
    print('save');
  }

  void removeLoginDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLogin');
    await prefs.remove('isemail');
    print(await prefs.remove('isLogin'));
  }
}
