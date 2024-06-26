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
    apiKey: 'AIzaSyBCZX17aptutxJz_r_FNO5EwLhePK5I3Qc',
    appId: '1:898422614135:web:b67aed106a51d175243e72',
    messagingSenderId: '898422614135',
    projectId: 'firsbase-auth-app',
    authDomain: 'firsbase-auth-app.firebaseapp.com',
    storageBucket: 'firsbase-auth-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9rhm68yT0uANuLiyaJzlOEB-FabyOsGg',
    appId: '1:898422614135:android:19aee93da4653b6a243e72',
    messagingSenderId: '898422614135',
    projectId: 'firsbase-auth-app',
    storageBucket: 'firsbase-auth-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjFCQK2KAC4xBCsULiGBFMNly_bxSiWmc',
    appId: '1:898422614135:ios:23f7472cb3055bac243e72',
    messagingSenderId: '898422614135',
    projectId: 'firsbase-auth-app',
    storageBucket: 'firsbase-auth-app.appspot.com',
    iosBundleId: 'com.google.firebase.persents.firebaseconnations',
  );
}
