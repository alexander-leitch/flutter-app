// File: lib/firebase_options.dart
// This is a placeholder file.
// The user needs to generate this file using the FlutterFire CLI.
// flutterfire configure

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyC2L8LW9BoNDMqTxW9K6SJEFqvsC4dOQ0E',
    appId: '1:153605829362:web:1b5d80a0f0a2df6d5ad66b',
    messagingSenderId: '153605829362',
    projectId: 'flutter-app-ddddf',
    authDomain: 'flutter-app-ddddf.firebaseapp.com',
    storageBucket: 'flutter-app-ddddf.firebasestorage.app',
    measurementId: 'G-WBBJZ7P956',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAXib85ymJBCkRSe66tUVP4YgibOez6io',
    appId: '1:153605829362:ios:8894e02ac648648e5ad66b',
    messagingSenderId: '153605829362',
    projectId: 'flutter-app-ddddf',
    storageBucket: 'flutter-app-ddddf.firebasestorage.app',
    androidClientId: '153605829362-80q84m9no2l20p8ptnv9brinjvjekab1.apps.googleusercontent.com',
    iosClientId: '153605829362-0dthh0ca9cd9hml56rltbj5rv2q1gdka.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2EZNUol1fhOx3KboHdiZqvh8eE-QMpKI',
    appId: '1:153605829362:android:e35d2b472f54d67c5ad66b',
    messagingSenderId: '153605829362',
    projectId: 'flutter-app-ddddf',
    storageBucket: 'flutter-app-ddddf.firebasestorage.app',
  );

}