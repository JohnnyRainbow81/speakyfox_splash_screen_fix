import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:speakyfox/app/utilities.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';
import 'package:speakyfox/presentation/common/resources/image_assets.dart';
import 'package:speakyfox/presentation/common/widgets/hint.dart';
import 'package:speakyfox/presentation/screens/authentication/authentication_viewmodel.dart';
import 'package:speakyfox/presentation/screens/authentication/common/logo.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/dependency_injection.dart';
import '../../../common/routing.dart';
import '../../../common/widgets/errors/error_common_dialog.dart';
import '../../../common/widgets/loading_animation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthenticationViewModel _authenticationViewModel = locator<AuthenticationViewModel>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final ScrollController _scrollController;

  final _formKey = GlobalKey<FormState>();
  final FocusScopeNode _node = FocusScopeNode();

  String? usernameError;
  String? passwordError;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //If user is logged in when starting the app she gets directly transfered to home screen
      if (_authenticationViewModel.isLoggedIn) {
        goToHomeScreen();
      }
    });

    _emailController.text = _authenticationViewModel.email;
    _passwordController.text = _authenticationViewModel.password;

    _emailController.addListener(() => _authenticationViewModel.validateEmail(_emailController.text));
    _passwordController.addListener(() => _authenticationViewModel.validatePassword(_passwordController.text));

    _scrollController = ScrollController();
    _authenticationViewModel.reset();

    _node.addListener(onTextFieldFocus);
  }

  @override
  void dispose() {
    debugPrint("LoginScreen.dispose()");
    _emailController.removeListener(() => _authenticationViewModel.validateEmail);
    _passwordController.removeListener(() => _authenticationViewModel.validatePassword);

    _emailController.dispose();
    _passwordController.dispose();
    _scrollController.dispose();
    _node.removeListener(onTextFieldFocus);
    _node.dispose();

    super.dispose();
  }

  void goToHomeScreen() {
    Future.delayed(const Duration(milliseconds: 500), (() {
      if (mounted) {
        GoRouter.of(context).go(Routing.home);
      }
    }));
  }

  void goToRegistrationScreen() {
    GoRouter.of(context).go(Routing.register);
  }

  void goToResetPasswordScreen() {
    GoRouter.of(context).push(Routing.resetPassword);
  }

// Strangely this needs to be in *this* class instead of putting this very same method
// into the viewModel-class to work properly. WhyTF??
  bool isLoginEnabled() {
    return (!_authenticationViewModel.isLoggedIn &&
        !_authenticationViewModel.isBusy &&
        _authenticationViewModel.isLoginFormValid);
  }

// Let the ViewModel know about focus changes to inform the
//Speakyfox Logo, which is seperate widget, about focus changes.
  void onTextFieldFocus() {
    _authenticationViewModel.hasTextFieldFocus = _node.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => _authenticationViewModel,
      builder: (context, _, child) {
        debugPrint("LoginScreen.builder() ");

        if (_authenticationViewModel.hasError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            //Check if this screen is current screen(=shown to the user) because
            //there are 3 other screens listening to the same viewModel
            if (ModalRoute.of(context) != null && ModalRoute.of(context)!.isCurrent) {
              showErrorCommonDialog(context: context, exception: _authenticationViewModel.modelError);
              _authenticationViewModel.clearErrors();
            }
          });
        }
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 8.0, right: 8.0, left: 8.0),
              child: Card(
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: FocusScope(
                      node: _node,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24.0, bottom: 12.0, left: 12.0, right: 12.0),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // const SizedBox(height: 36),
                              const Logo(key: Key("Logo")),
                              const SizedBox(
                                height: 24,
                              ),
                              Text("Log' dich ein",
                                  style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                enableInteractiveSelection: true,
                                keyboardType: TextInputType.emailAddress,
                                autofillHints: const [AutofillHints.email],
                                decoration: InputDecoration(
                                  hintText: "E-Mail",
                                  errorText: _authenticationViewModel.emailError,
                                  prefixIcon: const Icon(Icons.email),
                                ),
                                controller: _emailController,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: _node.nextFocus,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextFormField(
                                enableInteractiveSelection: true,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                autofillHints: const [AutofillHints.password],
                                decoration: InputDecoration(
                                    hintText: "Passwort",
                                    errorText: _authenticationViewModel.passwordError,
                                    errorMaxLines: 8,
                                    prefixIcon: const Icon(Icons.key)),
                                controller: _passwordController,
                                onEditingComplete: () {
                                  _node.unfocus();
                                },
                              ),

                              _authenticationViewModel.isLoggedIn
                                  ? const Hint("Login erfolgreich!")
                                  : const SizedBox.shrink(),
                              const SizedBox(
                                height: 32,
                              ),
                              ElevatedButton(
                                //if not valid or busy, button text is inactive
                                onPressed: isLoginEnabled()
                                    ? () async => _authenticationViewModel
                                        .login()
                                        .then((_) => _authenticationViewModel.isLoggedIn ? goToHomeScreen() : null)
                                    : null, //Needs to be null to show as a disabled button
                                child: _authenticationViewModel.isBusy ? const LoadingAnimation() : const Text("Login"),
                              ),
                              const SizedBox(height: 24),
                              TextButton(
                                  onPressed: () => goToResetPasswordScreen(), child: const Text("Passwort vergessen?")),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Neu hier?"),
                                  TextButton(
                                      onPressed: () => goToRegistrationScreen(),
                                      child: const Text("Erstelle einen Account")),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
