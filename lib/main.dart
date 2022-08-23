import 'dart:async';
import 'dart:isolate';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/firebase_options.dart';
import 'app/app.dart';
import 'app/dependency_injection.dart';

bool isQABackendAvailable = false; //delete later
//import 'firebase_options.dart';
main() async {
  //Error handling setup
  //If an error is thrown in a zone, it stays within its boundaries
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

//**IMPORTANT! Every project needs an own Firebase-Account > check the init steps here:
// https://firebase.google.com/docs/flutter/setup?platform=ios */
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await BuildEnvironment.init();

    //If [false], crashdata is only collected on the local device > [true] for sending errors to remote Crashlytics
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    //TODO Specify anonymous user hash for identification in Crashlytics
    FirebaseCrashlytics.instance.setUserIdentifier("some_hashed_user_identifier"); //Specify user later

    //Called whenever Flutter framework catches an error. By default, this calles [FlutterError.presentError]
    FlutterError.onError = (details) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      FirebaseCrashlytics.instance.recordFlutterError(details);
    };

    //For errors coming from outside of Flutter context
    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
        fatal: true,
      );
    }).sendPort);

    //dependency injection of authentication stuff until we have an authToken
    await initializeAuthenticationDependencies();

    runApp(Phoenix(child: SpeakyFox()));
  }, (Object error, StackTrace stack) {
    //Error that aren't caught by Flutter
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  },
      //Errors normally should not crossed Zone boundaries, so this might be redundant..
      zoneSpecification: ZoneSpecification(
    handleUncaughtError: (self, parent, zone, error, stackTrace) {
      if (kDebugMode) {
        print("Caught uncaught Error outside of ErrorZone: Error: ${error.runtimeType}, Stacktrace: $stackTrace");
      }
    },
  ));
}
