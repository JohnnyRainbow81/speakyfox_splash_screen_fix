import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/routes.dart';
import 'package:speakyfox/presentation/common/widgets/errors/common_error_dialog.dart';
import 'package:speakyfox/presentation/screens/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _loginViewModel = locator<LoginViewModel>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final ScrollController _scrollController;

  final _formKey = GlobalKey<FormState>();
  String? usernameError;
  String? passwordError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController.addListener(() => _loginViewModel.validateUsername(_usernameController.text));
    _passwordController.addListener(() => _loginViewModel.validatePassword(_passwordController.text));

    _scrollController = ScrollController();
  }

  // void validateUsername() {
  //   setState(() => usernameError = _loginViewModel.validateUsername(_usernameController.text) ?? "");
  // }

  // void validatePassword() {
  //   setState(() => passwordError = _loginViewModel.validatePassword(_passwordController.text) ?? "");
  // }

  @override
  void dispose() {
    _usernameController.removeListener(() => _loginViewModel.validateUsername);
    _passwordController.removeListener(() => _loginViewModel.validatePassword);
    _usernameController.dispose();
    _passwordController.dispose();
    
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("LoginScreen.build() ");
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => _loginViewModel,
      builder: (context, _, child) {
        if (_loginViewModel.hasError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            showCommonErrorDialog(context: context, exception: _loginViewModel.modelError);
            _loginViewModel.clearErrors();
          });
        }
       // double height = MediaQuery.of(context).size.height;

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
                        decoration: InputDecoration(
                            hintText: "Username / E-Mail",
                            errorText: _loginViewModel.userNameError,
                            prefixIcon: const Icon(Icons.people)),
                        controller: _usernameController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Passwort",
                            errorText: _loginViewModel.passwordError,
                            errorMaxLines: 8,
                            prefixIcon: const Icon(Icons.key)),
                        controller: _passwordController,
                      ),
                      _loginViewModel.isLoggedIn
                          ? const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text("Login erfolgreich!"),
                            )
                          : Container(),
                      const SizedBox(
                        height: 32,
                      ),
                      ElevatedButton(
                          onPressed:
                              _loginViewModel.isLoginFormValid ? () async => _loginViewModel.login() : null,
                          child: const Text("Login")),
                      const SizedBox(height:24),
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
