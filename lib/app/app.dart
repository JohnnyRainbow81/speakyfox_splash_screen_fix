import 'package:flutter/material.dart';
import 'package:flutter_starterkit/presentation/common/widgets/errors/common_error_widget.dart';
import '../presentation/common/resources/themes.dart';
import '../presentation/common/routes.dart';

class FlutterStarterKitApp extends StatelessWidget {
  const FlutterStarterKitApp._();

//Singleton. There must only be one app at a time.
  static const FlutterStarterKitApp instance = FlutterStarterKitApp._();

  factory FlutterStarterKitApp() => instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(), 
      onGenerateRoute: Routes.getRoute,
      builder: (ctx, widget) {
        //Building an error widget to show to the user if a build()-method fails
        Widget error = const CommonErrorWidget();
        if (widget is Scaffold || widget is Navigator) {
          error = const Scaffold(body: CommonErrorWidget());
        }
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          //widget that will be shown when building of a normal widget fails
          //This widget has to be very basic
          return error;
        };
        if (widget != null) return widget;
        throw ('widget is null');
      },
      initialRoute: Routes.test, //just for testing > remove
    );
  }
}
