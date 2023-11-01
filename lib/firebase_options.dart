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
    apiKey: 'AIzaSyBJHeQELq5x8NM-aGnyu5oMd3TOcjHApg4',
    appId: '1:613196672783:web:8017a76f1894df1536987a',
    messagingSenderId: '613196672783',
    projectId: 'mystical-sphinx-403605',
    authDomain: 'mystical-sphinx-403605.firebaseapp.com',
    storageBucket: 'mystical-sphinx-403605.appspot.com',
    measurementId: 'G-2SFGSFFVTY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoV124eFm7Bm-0Ceg44va-ht9v02XZtn0',
    appId: '1:613196672783:android:ca9a5889269caccb36987a',
    messagingSenderId: '613196672783',
    projectId: 'mystical-sphinx-403605',
    storageBucket: 'mystical-sphinx-403605.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6eCY75W6BaecgAyaBWoARTJHKnpR5_Q0',
    appId: '1:613196672783:ios:059847eb6ddeb2fc36987a',
    messagingSenderId: '613196672783',
    projectId: 'mystical-sphinx-403605',
    storageBucket: 'mystical-sphinx-403605.appspot.com',
    iosBundleId: 'com.example.yourAppName',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6eCY75W6BaecgAyaBWoARTJHKnpR5_Q0',
    appId: '1:613196672783:ios:adb5732c15b782a436987a',
    messagingSenderId: '613196672783',
    projectId: 'mystical-sphinx-403605',
    storageBucket: 'mystical-sphinx-403605.appspot.com',
    iosBundleId: 'com.example.yourAppName.RunnerTests',
  );
}
