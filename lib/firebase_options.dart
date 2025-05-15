import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANVYau9xo-lLdPXRnrQuIOtmLqFz6sBA4',
    appId: '1:752923132524:android:6ce82119f0dd92859bce49',
    messagingSenderId: '752923132524',
    projectId: 'newflix-6c84f',
    storageBucket: 'newflix-6c84f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANVYau9xo-lLdPXRnrQuIOtmLqFz6sBA4',
    appId: '1:752923132524:ios:9e390b91d4c054a29bce49',
    messagingSenderId: '752923132524',
    projectId: 'newflix-6c84f',
    storageBucket: 'newflix-6c84f.firebasestorage.app',
    iosClientId:
        '817971862668-1j57iulk778nmipr0o4of6lkphb4pgac.apps.googleusercontent.com',
    iosBundleId: 'protime.newflix.net',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOjF_ZZJaxVzIiwIAAD0PN06KLwHKZAmc',
    appId: '1:817971862668:ios:4eaf70fc8ee1191ef9afa9',
    messagingSenderId: '752923132524',
    projectId: 'newflix-6c84f',
    storageBucket: 'newflix-808dc.appspot.com',
    iosClientId:
        '817971862668-t7h5nlif6eddpn5bpg2f7orjvf9cmhff.apps.googleusercontent.com',
    iosBundleId: 'protime.newflix.net',
  );
}
