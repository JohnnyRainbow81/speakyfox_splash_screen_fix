import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/presentation/common/widgets/errors/error_common_screen.dart';
import 'package:speakyfox/presentation/screens/authentication/login/login_screen.dart';
import 'package:speakyfox/presentation/screens/authentication/registration/registration_screen.dart';
import 'package:speakyfox/presentation/screens/authentication/reset_password.dart/reset_password_screen.dart';
import 'package:speakyfox/presentation/screens/home/home_screen.dart';
import 'package:speakyfox/presentation/screens/onboarding/onboarding_pager.dart';
import 'package:speakyfox/presentation/screens/test_screen.dart';

// class Routes {
//   // static const String test = "/test";
//   // static const String login = "/login";
//   // static const String resetPassword = "/resetPassword";
//   // static const String register = "/register";
//   // static const String onboarding = "/onboarding";
//   // static const String home = "/home";

//   // static Route<dynamic> getRoute(RouteSettings routeSettings) {
//   //   switch (routeSettings.name) {
//   //     case test:
//   //       return Platform.isIOS
//   //           ? CupertinoPageRoute(builder: (_) => const TestScreen())
//   //           : MaterialPageRoute(builder: (_) => const TestScreen());
//   //     case login:
//   //       return Platform.isIOS
//   //           ? CupertinoPageRoute(builder: (_) => const LoginScreen())
//   //           : MaterialPageRoute(builder: (_) => const LoginScreen());
//   //     case resetPassword:
//   //       return Platform.isIOS
//   //           ? CupertinoPageRoute(builder: (_) => const ResetPasswordScreen())
//   //           : MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
//   //     case onboarding:
//   //       return Platform.isIOS
//   //           ? CupertinoPageRoute(builder: (_) => const OnboardingPager())
//   //           : MaterialPageRoute(builder: (_) => const OnboardingPager());
//   //     case register:
//   //       return Platform.isIOS
//   //           ? CupertinoPageRoute(builder: (_) => const RegistrationScreen())
//   //           : MaterialPageRoute(builder: (_) => const RegistrationScreen());
//   //     case home:
//   //       return Platform.isIOS
//   //           ? CupertinoPageRoute(builder: (_) => HomeScreen())
//   //           : MaterialPageRoute(builder: (_) => HomeScreen());
//   //     default:
//   //       return _undefinedRouteScreen();
//   //   }
//   // }

//   // static Route<dynamic> _undefinedRouteScreen() {
//   //   const Widget undefinedRouteScreen = Scaffold(
//   //     body: Center(child: Text("No Route found")),
//   //   );
//   //   return Platform.isIOS
//   //       ? CupertinoPageRoute(builder: (_) => undefinedRouteScreen)
//   //       : MaterialPageRoute(builder: (_) => undefinedRouteScreen);
//   // }
// }

class Routing {
  static GoRouter? _instance;

  static const String test = "/test";
  static const String login = "/login";
  static const String resetPassword = "/resetPassword";
  static const String register = "/register";
  static const String onboarding = "/onboarding";
  static const String home = "/";

  static bool _isAppStart = true;

  Routing._();

  static GoRouter get instance => _instance ?? _init();

  static GoRouter _init() {
    _instance = GoRouter(
        redirect: (context, state) {
          bool loggedIn = locator<AuthenticationService>().isAuthenticated();
          bool goingToLogin = state.location == login || state.location == register || state.location == resetPassword;

          //User is not logged in > go to the authentication screens
          if (!loggedIn && !goingToLogin) return login;

          //User started app and is still logged in > go to home screen
          if (loggedIn && _isAppStart) {
            _isAppStart = false;
            return null; // no need to redirect
          }
          return null; // no need to redirect
        },
        routes: <GoRoute>[
          GoRoute(
              //name: login,
              path: login,
              pageBuilder: (context, state) => Platform.isIOS
                  ? const CupertinoPage(child: LoginScreen())
                  : const MaterialPage(child: LoginScreen())),
          GoRoute(
            //name: onboarding,
            path: onboarding,
            pageBuilder: (context, state) => Platform.isIOS
                ? const CupertinoPage(child: OnboardingPager())
                : const MaterialPage(child: OnboardingPager()),
          ),
          GoRoute(
            // name: home,
            path: home,
            pageBuilder: (context, state) =>
                Platform.isIOS ? const CupertinoPage(child: HomeScreen()) : const MaterialPage(child: HomeScreen()),
          ),
          GoRoute(
            // name: register,
            path: register,
            pageBuilder: (context, state) => Platform.isIOS
                ? const CupertinoPage(child: RegistrationScreen())
                : const MaterialPage(child: RegistrationScreen()),
          ),
          GoRoute(
            //name: resetPassword,
            path: resetPassword,
            pageBuilder: (context, state) => Platform.isIOS
                ? const CupertinoPage(child: ResetPasswordScreen())
                : const MaterialPage(child: ResetPasswordScreen()),
          ),
          GoRoute(
            // name: test,
            path: test,
            pageBuilder: (context, state) =>
                Platform.isIOS ? const CupertinoPage(child: TestScreen()) : const MaterialPage(child: TestScreen()),
          ),
        ],
        errorBuilder: (context, state) => ErrorCommonScreen(
              exception: state.error,
              path: state.fullpath,
              details: state.name,
            ));
    return _instance!;
  }
}