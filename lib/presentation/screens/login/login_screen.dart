import 'package:flutter/material.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/screens/login/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _loginViewModel = locator<LoginViewModel>();

  final _formKey = GlobalKey<FormState>();
  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text("Username"),
                  TextFormField(
                    validator: (username) => _loginViewModel.validateUsername(username),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text("Passwort"),
                  loggedIn ? const Text("Login successfull!") : Container(),
                  TextFormField(
                    validator: (username) => _loginViewModel.validateUsername(username),
                  ),
                  ElevatedButton(
                      onPressed: _loginViewModel.isLoginFormValid()
                          ? () async {
                              loggedIn = await _loginViewModel.login();
                            }
                          : null,
                      child: const Text("Login"))
                ],
              ))),
    );
  }
}
