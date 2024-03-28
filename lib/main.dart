import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  ///Add Widgets bindings
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Init Local Storage
  await GetStorage.init();

  //Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  //Initialize Authentication
  runApp(
    const App(),

    ///This is just for device preview
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const App(),
    // ),
  );
}
