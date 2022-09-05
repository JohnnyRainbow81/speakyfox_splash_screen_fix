import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/widgets/errors/common_error_dialog.dart';
import 'package:speakyfox/presentation/screens/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final LoginViewModel _loginViewModel = locator<LoginViewModel>();

  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => _loginViewModel.validateEmail(_emailController.text));
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
    debugPrint("ResetPasswordScreen.build() ");
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => _loginViewModel,
      disposeViewModel: false,
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
                            height: 48,
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
                              onPressed: _loginViewModel.isEmailValid ? () => _loginViewModel.sendEmail() : null,
                              child: const Text("Email versenden")),
                          const Spacer(),
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(), //to Login Screen
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
