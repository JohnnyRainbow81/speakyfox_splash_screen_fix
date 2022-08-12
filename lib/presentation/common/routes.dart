import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speakyfox/presentation/screens/login/login_screen.dart';
import '../screens/test_screen.dart';

class Routes {
  static const String test = "/test";

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.test:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const LoginScreen())
            : MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return _undefinedRouteScreen();
    }
  }

  static Route<dynamic> _undefinedRouteScreen() {
    const Widget undefinedRouteScreen = Scaffold(
      body: Center(child: Text("No Route found")),
    );
    return Platform.isIOS
        ? CupertinoPageRoute(builder: (_) => undefinedRouteScreen)
        : MaterialPageRoute(builder: (_) => undefinedRouteScreen);
  }
}
