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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCT9DmkurkJ_XXTBTmLfAYGnxT447vRvik',
    appId: '1:1097672297188:web:5f6e909de024799c993af1',
    messagingSenderId: '1097672297188',
    projectId: 'smart-pstu',
    authDomain: 'smart-pstu.firebaseapp.com',
    storageBucket: 'smart-pstu.appspot.com',
    measurementId: 'G-VX42HG2NL2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxE1sJir5HdbRL0UZLMTbPHe2qJKS3hUk',
    appId: '1:1097672297188:android:f60bf5ffb39c2f53993af1',
    messagingSenderId: '1097672297188',
    projectId: 'smart-pstu',
    storageBucket: 'smart-pstu.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNfb4YnU8Rdllz_vE9cG9F1Z8t6pfkD5E',
    appId: '1:1097672297188:ios:2ec0ac7417c36dbd993af1',
    messagingSenderId: '1097672297188',
    projectId: 'smart-pstu',
    storageBucket: 'smart-pstu.appspot.com',
    androidClientId: '1097672297188-5ic37nb87iiu3um94h0844m3cb1ckgeu.apps.googleusercontent.com',
    iosClientId: '1097672297188-jfd27nbgdcogq6a70fvijlmegqfvjf9h.apps.googleusercontent.com',
    iosBundleId: 'com.example.sohojKart',
  );
}
