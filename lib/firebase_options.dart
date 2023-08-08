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
    apiKey: 'AIzaSyBtLVlbTV9aMMVUM9QYKQAKcY40lOCZ3Ss',
    appId: '1:142588789867:web:5856d506a17bd1bbfc5d2e',
    messagingSenderId: '142588789867',
    projectId: 'tic-tac-toe-multiplayers',
    authDomain: 'tic-tac-toe-multiplayers.firebaseapp.com',
    storageBucket: 'tic-tac-toe-multiplayers.appspot.com',
    measurementId: 'G-63W089N603',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCM9vOFvxtL7zQLAV3CpYpefs7CdOgWSbM',
    appId: '1:142588789867:android:d1810120c7e241a6fc5d2e',
    messagingSenderId: '142588789867',
    projectId: 'tic-tac-toe-multiplayers',
    storageBucket: 'tic-tac-toe-multiplayers.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsLYV6nB-jFSM85agcIbYGcwp_XIxLBjw',
    appId: '1:142588789867:ios:9321fe573a80f630fc5d2e',
    messagingSenderId: '142588789867',
    projectId: 'tic-tac-toe-multiplayers',
    storageBucket: 'tic-tac-toe-multiplayers.appspot.com',
    iosClientId: '142588789867-1herneqkdohd80a61osv58r3m489abvv.apps.googleusercontent.com',
    iosBundleId: 'com.example.ticTacToeNew',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAsLYV6nB-jFSM85agcIbYGcwp_XIxLBjw',
    appId: '1:142588789867:ios:feef170c0fae3245fc5d2e',
    messagingSenderId: '142588789867',
    projectId: 'tic-tac-toe-multiplayers',
    storageBucket: 'tic-tac-toe-multiplayers.appspot.com',
    iosClientId: '142588789867-ltcg1ahg7co8k9pn6p8o23tesl74lcn4.apps.googleusercontent.com',
    iosBundleId: 'com.example.ticTacToeNew.RunnerTests',
  );
}