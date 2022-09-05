import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';
import 'package:speakyfox/presentation/common/routes.dart';
import 'package:speakyfox/presentation/common/widgets/errors/common_error_dialog.dart';
import 'package:speakyfox/presentation/screens/login/login_viewmodel.dart';
import 'package:speakyfox/presentation/screens/login/sf_textfield.dart';
import 'package:stacked/stacked.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final LoginViewModel _loginViewModel = locator<LoginViewModel>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? usernameError;
  String? passwordError;
  String? emailError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController.addListener(() => _loginViewModel.validateUsername(_usernameController.text));
    _passwordController.addListener(() => _loginViewModel.validatePassword(_passwordController.text));
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
    _usernameController.removeListener(() => _loginViewModel.validateUsername);
    _passwordController.removeListener(() => _loginViewModel.validatePassword);
    _emailController.removeListener(() => _loginViewModel.validateEmail);

    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("RegistrationScreen.build() ");
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => _loginViewModel,
      builder: (context, _, child) {
        if (_loginViewModel.hasError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            showCommonErrorDialog(context: context, exception: _loginViewModel.modelError);
            _loginViewModel.clearErrors();
          });
        }
        double height = MediaQuery.of(context).size.height * 0.9;

        return Scaffold(
          body: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8.0, right: 8.0, left: 8.0),
            child: Card(
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: height,
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
                            Text("Erstelle deinen Zugang",
                                style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Name",
                                  errorText: _loginViewModel.userNameError,
                                  prefixIcon: const Icon(Icons.people)),
                              controller: _usernameController,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "E-Mail",
                                  errorText: _loginViewModel.emailError,
                                  prefixIcon: const Icon(Icons.email)),
                                  controller: _emailController,
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
                                    _loginViewModel.isRegisterFormValid ? () async => _loginViewModel.register() : null,
                                child: const Text("Zugang erstellen")),
                            const Spacer(flex: 2),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Hast du bereits einen Account?"),
                                TextButton(
                                    onPressed: () => Navigator.of(context).pushNamed(Routes.login),
                                    child: const Text("Zum Login")),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          )),
        );
      },
    );
  }
}
