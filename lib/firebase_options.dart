// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDVdcAF3LfOaHvTThWIfdqIWZUmxtFDlxo',
    appId: '1:794543134943:web:e13f120af8d220df75716a',
    messagingSenderId: '794543134943',
    projectId: 'chat-app-c8be7',
    authDomain: 'chat-app-c8be7.firebaseapp.com',
    storageBucket: 'chat-app-c8be7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEzCzzxyFB4fFlL9ATsoFUkOcoESaM52Q',
    appId: '1:794543134943:android:2cbc03506d6dfcac75716a',
    messagingSenderId: '794543134943',
    projectId: 'chat-app-c8be7',
    storageBucket: 'chat-app-c8be7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBM3DPwwlXntS4EddEjhlCK9JYenAL_r9g',
    appId: '1:794543134943:ios:6cc16bc2cb093e4c75716a',
    messagingSenderId: '794543134943',
    projectId: 'chat-app-c8be7',
    storageBucket: 'chat-app-c8be7.appspot.com',
    iosBundleId: 'com.example.scholarchat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBM3DPwwlXntS4EddEjhlCK9JYenAL_r9g',
    appId: '1:794543134943:ios:6cc16bc2cb093e4c75716a',
    messagingSenderId: '794543134943',
    projectId: 'chat-app-c8be7',
    storageBucket: 'chat-app-c8be7.appspot.com',
    iosBundleId: 'com.example.scholarchat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDVdcAF3LfOaHvTThWIfdqIWZUmxtFDlxo',
    appId: '1:794543134943:web:2fc9ccfb279ed16675716a',
    messagingSenderId: '794543134943',
    projectId: 'chat-app-c8be7',
    authDomain: 'chat-app-c8be7.firebaseapp.com',
    storageBucket: 'chat-app-c8be7.appspot.com',
  );
}
