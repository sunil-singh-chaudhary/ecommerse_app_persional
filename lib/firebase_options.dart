// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA6gv5GryYmRP4TVwxUX_jXVvAGvJmldFs',
    appId: '1:1091165278235:web:db881437d5384bf59ae8be',
    messagingSenderId: '1091165278235',
    projectId: 'fbconnectfire',
    authDomain: 'fbconnectfire.firebaseapp.com',
    storageBucket: 'fbconnectfire.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiKCyiMgedj7dr-Yc2Ezh4ntYRIVudCMo',
    appId: '1:1091165278235:android:515b18bde84bc0429ae8be',
    messagingSenderId: '1091165278235',
    projectId: 'fbconnectfire',
    storageBucket: 'fbconnectfire.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCljQETja5xeAkMpEmDMqdFm764a3R2_h8',
    appId: '1:1091165278235:ios:c85868034036283c9ae8be',
    messagingSenderId: '1091165278235',
    projectId: 'fbconnectfire',
    storageBucket: 'fbconnectfire.appspot.com',
    iosClientId: '1091165278235-ma0rm60pkv2d9enhae6bpse7b6u25117.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerseAppPersional',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCljQETja5xeAkMpEmDMqdFm764a3R2_h8',
    appId: '1:1091165278235:ios:114dc7c40e7e8d9f9ae8be',
    messagingSenderId: '1091165278235',
    projectId: 'fbconnectfire',
    storageBucket: 'fbconnectfire.appspot.com',
    iosClientId: '1091165278235-litq51bltov0ndmq5gt10oj0fsadq8bg.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerseAppPersional.RunnerTests',
  );
}
