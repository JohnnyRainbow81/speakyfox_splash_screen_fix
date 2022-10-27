import 'package:go_router/go_router.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/presentation/common/widgets/errors/error_common_screen.dart';
import 'package:speakyfox/presentation/screens/authentication/login/login_screen.dart';
import 'package:speakyfox/presentation/screens/authentication/registration/registration_screen.dart';
import 'package:speakyfox/presentation/screens/authentication/reset_password.dart/reset_password_screen.dart';
import 'package:speakyfox/presentation/screens/home/home_screen.dart';
import 'package:speakyfox/presentation/screens/onboarding/onboarding_pager.dart';
import 'package:speakyfox/presentation/screens/profile/language_selection/language_selection_screen.dart';
import 'package:speakyfox/presentation/screens/profile/my_purchases/my_purchases_screen.dart';
import 'package:speakyfox/presentation/screens/profile/profile_screen.dart';
import 'package:speakyfox/presentation/screens/profile/settings/settings_screen.dart';
import 'package:speakyfox/presentation/screens/profile/unlock/unlock_screen.dart';
import 'package:speakyfox/presentation/screens/tests/ci_test_screen.dart';

class Routing {
  static GoRouter? _instance;

  static const String test = "/test";
  static const String login = "/login";
  static const String resetPassword = "/resetPassword";
  static const String register = "/register";
  static const String onboarding = "/onboarding";
  static const String home = "/";
  static const String profile = "/profile";
  static const String myPurchases = "/myPurchases";
  static const String unlock = "/unlock";
  static const String settings = "/settings";
  static const String languageSelection = "/languageSelection";

  static bool _isAppStart = true;

  Routing._();

  static GoRouter get instance => _instance ?? _init();

  static GoRouter _init() {
    _instance = GoRouter(
      //initialLocation: test,
        redirect: (context, state) {
          bool loggedIn = locator<AuthenticationService>().isAuthenticated();
          bool goingToLogin = state.location == login || state.location == register || state.location == resetPassword;

          //User is not logged in > go to the authentication screens
          if (!loggedIn && !goingToLogin) return login;

          //User started app and is still logged in
          if (loggedIn && _isAppStart) {
            _isAppStart = false;
            return null; // no need to redirect (will be default "/" route)
          }
          return null; // no need to redirect
        },
        routes: <GoRoute>[
          GoRoute(path: onboarding, builder: (context, state) => const OnboardingPager()),
          GoRoute(path: register, builder: (context, state) => const RegistrationScreen()),
          GoRoute(path: login, builder: (context, state) => const LoginScreen()),
          GoRoute(path: resetPassword, builder: (context, state) => const ResetPasswordScreen()),
          GoRoute(path: home, builder: (context, state) => const HomeScreen()),
          GoRoute(path: profile, builder: (context, state) => const ProfileScreen()),
          GoRoute(path: myPurchases, builder: (context, state) => MyPurchasesScreen()),
          GoRoute(path: unlock, builder: (context, state) => UnlockScreen()),
          GoRoute(path: settings, builder: (context, state) => SettingsScreen()),
          GoRoute(path: languageSelection, builder: (context, state) => LanguageSelectionScreen()),
          GoRoute(path: resetPassword, builder: (context, state) => const ResetPasswordScreen()),

          GoRoute(path: test, builder: (context, state) => const CITestScreen()),
        ],
        errorBuilder: (context, state) => ErrorCommonScreen(
              exception: state.error,
              path: state.fullpath,
              details: state.name,
            ));
    return _instance!;
  }
}

enum TransitionDirection { up, down, left, right }


