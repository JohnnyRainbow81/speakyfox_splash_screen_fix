import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/widgets/errors/common_error_dialog.dart';
import 'package:speakyfox/presentation/screens/login/login_viewmodel.dart';
import 'package:speakyfox/presentation/screens/login/sf_textfield.dart';
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
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset("assets/images/logo_speakyfox.png"),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Text("Log' dich ein",
                            style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
                        const SizedBox(
                          height: 16,
                        ),
                        SFTextField(iconData: Icons.person, controller: _usernameController, hintText: "Username"),
                        const SizedBox(
                          height: 24,
                        ),
                        SFTextField(iconData: Icons.key, controller: _passwordController, hintText: "Passwort"),

                        //const Text("Passwort"),
                        _loginViewModel.isLoggedIn ? const Text("Login successful!") : Container(),
                        const SizedBox(
                          height: 24,
                        ),

                        ElevatedButton(
                            onPressed: () async {
                              if (_loginViewModel.isLoginFormValid()) {
                                _loginViewModel.login();
                              }
                            },
                            child: const Text("Login")),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Neu hier?"),
                            TextButton(onPressed: null, child: Text("Erstelle einen Account")),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          )),
        );
      },
    );
  }
}
