import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:speakyfox/presentation/screens/authentication/authentication_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/dependency_injection.dart';
import '../../../common/routes.dart';
import '../../../common/widgets/errors/common_error_dialog.dart';
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
  String? usernameError;
  String? passwordError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text = _authenticationViewModel.email;
    _passwordController.text = _authenticationViewModel.password;

    _emailController.addListener(() => _authenticationViewModel.validateEmail(_emailController.text));
    _passwordController.addListener(() => _authenticationViewModel.validatePassword(_passwordController.text));

    _scrollController = ScrollController();

    _authenticationViewModel.reset();
  }

  // void validateUsername() {
  //   setState(() => usernameError = _authenticationViewModel.validateUsername(_usernameController.text) ?? "");
  // }

  // void validatePassword() {
  //   setState(() => passwordError = _authenticationViewModel.validatePassword(_passwordController.text) ?? "");
  // }

  @override
  void dispose() {
    debugPrint("LoginScreen.dispose()");
    _emailController.removeListener(() => _authenticationViewModel.validateEmail);
    _passwordController.removeListener(() => _authenticationViewModel.validatePassword);
    _emailController.dispose();
    _passwordController.dispose();

    _scrollController.dispose();
    super.dispose();
  }

  void goToNextScreen() {
    Navigator.of(context).pushReplacementNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("LoginScreen.build() ");
    return ViewModelBuilder.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => _authenticationViewModel,
      builder: (context, _, child) {
        if (_authenticationViewModel.hasError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            //Check if this screen is current screen(=shown to the user) because
            //there are 3 other screens listening to the same viewModel
            if (ModalRoute.of(context) != null && ModalRoute.of(context)!.isCurrent) {
              showCommonErrorDialog(context: context, exception: _authenticationViewModel.modelError);
              _authenticationViewModel.clearErrors();
            }
          });
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8.0, right: 8.0, left: 8.0),
            child: Card(
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 36),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset("assets/images/logo_speakyfox.png"),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Text("Log' dich ein",
                              style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "E-Mail",
                              errorText: _authenticationViewModel.emailError,
                              prefixIcon: const Icon(Icons.email),
                            ),
                            controller: _emailController,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Passwort",
                                errorText: _authenticationViewModel.passwordError,
                                errorMaxLines: 8,
                                prefixIcon: const Icon(Icons.key)),
                            controller: _passwordController,
                          ),
                          _authenticationViewModel.isLoggedIn
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text("Login erfolgreich!"),
                                )
                              : Container(),
                          const SizedBox(
                            height: 32,
                          ),
                          ElevatedButton(
                            onPressed: _authenticationViewModel.isLoginFormValid //if not valid, button text is inactive
                                ? () async =>
                                    _authenticationViewModel.login().then((isLoggedIn) => isLoggedIn ? goToNextScreen() : null)
                                : null,
                            child: _authenticationViewModel.isBusy ? const LoadingAnimation() : const Text("Login"),
                          ),
                          const SizedBox(height: 24),
                          TextButton(
                              onPressed: () => Navigator.of(context).pushNamed(Routes.resetPassword),
                              child: const Text("Passwort vergessen?")),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Neu hier?"),
                              TextButton(
                                  onPressed: () => Navigator.of(context).pushNamed(Routes.register),
                                  child: const Text("Erstelle einen Account")),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
