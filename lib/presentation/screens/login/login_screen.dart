import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:speakyfox/app/dependency_injection.dart';
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

  final _formKey = GlobalKey<FormState>();
  String usernameError = "";
  String passwordError = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController.addListener(() => validateUsername());
    _passwordController.addListener(() => validatePassword());
  }

  void validateUsername() {
    setState(() => usernameError = _loginViewModel.validateUsername(_usernameController.text) ?? "");
  }

  void validatePassword() {
    setState(() => passwordError = _loginViewModel.validatePassword(_passwordController.text) ?? "");
  }

  @override
  void dispose() {
    _usernameController.removeListener(() => validateUsername());
    _passwordController.removeListener(() => validatePassword());
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => _loginViewModel,
      builder: (context, _, child) {
        if (_loginViewModel.hasError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            showCommonErrorDialog(context: context, exception: _loginViewModel.modelError);
            _loginViewModel.clearErrors();
          });
        }
        return Scaffold(
          body: Center(
              child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Username"),
                      TextFormField(
                        decoration: InputDecoration(hintText: "username", errorText: usernameError),
                        controller: _usernameController,
                        //validator: (username) => _loginViewModel.validateUsername(username),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text("Passwort"),
                      _loginViewModel.isLoggedIn ? const Text("Login successful!") : Container(),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        decoration: InputDecoration(hintText: "password", errorText: passwordError),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (_loginViewModel.isLoginFormValid()) {
                              _loginViewModel.login();
                            }
                          },
                          child: const Text("Login"))
                    ],
                  ))),
        );
      },
    );
  }
}
