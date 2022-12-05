// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
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
    apiKey: 'AIzaSyBrSIkXQHpNXTUw13I7lTktY2HM5aZBkJQ',
    appId: '1:289444334334:web:1c7313309bef2c203633af',
    messagingSenderId: '289444334334',
    projectId: 'flutter-mydishes',
    authDomain: 'flutter-mydishes.firebaseapp.com',
    storageBucket: 'flutter-mydishes.appspot.com',
    measurementId: 'G-RSF12DJGQM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUoC8zAQu1gPd9CWRCkHWWu2nIDEOfDuI',
    appId: '1:289444334334:android:ba0c528efc64de313633af',
    messagingSenderId: '289444334334',
    projectId: 'flutter-mydishes',
    storageBucket: 'flutter-mydishes.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJDlg0qpYIuWUXhGgOrHWoG7SeDz06cyY',
    appId: '1:289444334334:ios:edc195c5353ff6753633af',
    messagingSenderId: '289444334334',
    projectId: 'flutter-mydishes',
    storageBucket: 'flutter-mydishes.appspot.com',
    iosClientId:
        '289444334334-u7thilqn01hqsqvjraauviejuchhlrpc.apps.googleusercontent.com',
    iosBundleId: 'com.ahmnouira.FlutterDishes.flutterDishes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJDlg0qpYIuWUXhGgOrHWoG7SeDz06cyY',
    appId: '1:289444334334:ios:edc195c5353ff6753633af',
    messagingSenderId: '289444334334',
    projectId: 'flutter-mydishes',
    storageBucket: 'flutter-mydishes.appspot.com',
    iosClientId:
        '289444334334-u7thilqn01hqsqvjraauviejuchhlrpc.apps.googleusercontent.com',
    iosBundleId: 'com.ahmnouira.FlutterDishes.flutterDishes',
  );
}
