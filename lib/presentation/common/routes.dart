import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/presentation/screens/login/login_screen.dart';
import 'package:speakyfox/presentation/screens/onboarding/onboarding_pager.dart';
import 'package:speakyfox/presentation/screens/registration/registration_screen.dart';
import 'package:speakyfox/presentation/screens/reset_password.dart/reset_password_screen.dart';
import 'package:speakyfox/presentation/screens/test_screen.dart';

class Routes {
  static const String test = "/test";
  static const String login = "/login";
  static const String resetPassword = "/resetPassword";
  static const String register = "/register";
  static const String onboarding = "/onboarding";

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.test:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const TestScreen())
            : MaterialPageRoute(builder: (_) => const TestScreen());
      case Routes.login:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const LoginScreen())
            : MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.resetPassword:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const ResetPasswordScreen())
            : MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.onboarding:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const OnboardingPager())
            : MaterialPageRoute(builder: (_) => const OnboardingPager());
            case Routes.register:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const RegistrationScreen())
            : MaterialPageRoute(builder: (_) => const RegistrationScreen());
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
