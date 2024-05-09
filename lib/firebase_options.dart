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
    apiKey: 'AIzaSyDHUhg55TzQMmjTOb_GSrFDCQgDVJiyeWo',
    appId: '1:278321461080:web:37cb4766d0701ba2ea572d',
    messagingSenderId: '278321461080',
    projectId: 'pillset-76021',
    authDomain: 'pillset-76021.firebaseapp.com',
    storageBucket: 'pillset-76021.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQBQDfox1pnssqWxE69BrzMawHoZ13O0k',
    appId: '1:278321461080:android:111b98ba0252d604ea572d',
    messagingSenderId: '278321461080',
    projectId: 'pillset-76021',
    storageBucket: 'pillset-76021.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHdk-aXLjgkSd08iRw_JNkh4NqlUU3_0M',
    appId: '1:278321461080:ios:38fe6e5963d02d79ea572d',
    messagingSenderId: '278321461080',
    projectId: 'pillset-76021',
    storageBucket: 'pillset-76021.appspot.com',
    iosBundleId: 'com.example.pillSet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHdk-aXLjgkSd08iRw_JNkh4NqlUU3_0M',
    appId: '1:278321461080:ios:38fe6e5963d02d79ea572d',
    messagingSenderId: '278321461080',
    projectId: 'pillset-76021',
    storageBucket: 'pillset-76021.appspot.com',
    iosBundleId: 'com.example.pillSet',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDHUhg55TzQMmjTOb_GSrFDCQgDVJiyeWo',
    appId: '1:278321461080:web:43d74acdec0762f1ea572d',
    messagingSenderId: '278321461080',
    projectId: 'pillset-76021',
    authDomain: 'pillset-76021.firebaseapp.com',
    storageBucket: 'pillset-76021.appspot.com',
  );
}