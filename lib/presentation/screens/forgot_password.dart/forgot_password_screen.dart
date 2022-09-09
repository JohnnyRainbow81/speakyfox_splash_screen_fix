import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/widgets/errors/common_error_dialog.dart';
import 'package:speakyfox/presentation/screens/authentication/authentication_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPasswordScreen> {
  final AuthenticationViewModel _loginViewModel = locator<AuthenticationViewModel>();

  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => _loginViewModel.validateUsername(_emailController.text));
  }

  // void validateUsername() {
  //   setState(() => usernameError = _loginViewModel.validateUsername(_usernameController.text) ?? "");
  // }

  // void validatePassword() {
  //   setState(() => passwordError = _loginViewModel.validatePassword(_passwordController.text) ?? "");
  // }

  @override
  void dispose() {
    _emailController.removeListener(() => _loginViewModel.validateEmail);
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("ForgotPasswordScreen.build() ");
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => _loginViewModel,
      builder: (context, _, child) {
        if (_loginViewModel.hasError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            showCommonErrorDialog(context: context, exception: _loginViewModel.modelError);
            _loginViewModel.clearErrors();
          });
        }
        return SafeArea(
          child: Scaffold(
            body: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
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
                          Text("Passwort zurücksetzen",
                              style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "E-Mail",
                                errorText: _loginViewModel.emailError,
                                prefixIcon: const Icon(Icons.email)),
                            controller: _emailController,
                          ),
                          _loginViewModel.isLoggedIn
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text("Wir haben dir eine Email geschickt"),
                                )
                              : Container(),
                          const SizedBox(
                            height: 24,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                if (_loginViewModel.isLoginFormValid) {
                                  _loginViewModel.login();
                                }
                              },
                              child: const Text("Login")),
                          const Spacer(),
                          TextButton(
                              onPressed: () => null, //to Login Screen
                              child: const Text("Zurück zum Login")),
                        ],
                      ),
                    )),
              ),
            )),
          ),
        );
      },
    );
  }
}
