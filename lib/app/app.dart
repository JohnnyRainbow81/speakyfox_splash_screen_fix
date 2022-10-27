import 'package:flutter/material.dart';
import 'package:speakyfox/presentation/test_screen.dart';

class SpeakyFox extends StatelessWidget {
  const SpeakyFox._();

//Singleton. There must only be one app at a time.
  static const SpeakyFox _instance = SpeakyFox._();

  factory SpeakyFox() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "test",
      routes: {"test": (context) => TestScreen()},
      // builder: (ctx, widget) {
      //   //Building an error widget to show to the user if a build()-method fails
      //   Widget error = const ErrorCommonScreen();
      //   if (widget is Scaffold || widget is Navigator) {
      //     error = const ErrorCommonScreen();
      //   }
      //   ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      //     //widget that will be shown when building of a normal widget fails
      //     //This widget has to be very basic
      //     return error;
      //   };
      //   if (widget != null) return widget;
      //   throw ('widget is null');
      // },
    );
  }
}
