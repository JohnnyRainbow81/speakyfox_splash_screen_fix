import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:speakyfox/presentation/screens/authentication/authentication_viewmodel.dart';
import '../../../../app/dependency_injection.dart';
import '../../../common/routes.dart';
import '../../../common/widgets/errors/common_error_dialog.dart';
import 'package:stacked/stacked.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final AuthenticationViewModel _loginViewModel = locator<AuthenticationViewModel>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

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

    _loginViewModel.allInputsAreValid = onAllInputsAreValid;
  }

  // void validateUsername() {
  //   setState(() => usernameError = _loginViewModel.validateUsername(_usernameController.text) ?? "");
  // }

  // void validatePassword() {
  //   setState(() => passwordError = _loginViewModel.validatePassword(_passwordController.text) ?? "");
  // }

  @override
  void dispose() {
    debugPrint("RegistrationScreen.dispose()");

    _usernameController.removeListener(() => _loginViewModel.validateUsername);
    _passwordController.removeListener(() => _loginViewModel.validatePassword);
    _emailController.removeListener(() => _loginViewModel.validateEmail);

    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();

    _scrollController.dispose();

    _loginViewModel.allInputsAreValid = null;
    super.dispose();
  }

  void onAllInputsAreValid() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.initialScrollOffset,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("RegistrationScreen.build() ");
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => _loginViewModel,
      builder: (context, _, child) {
        if (_loginViewModel.hasError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            //Check if this screen is current screen(=shown to the user) because
            //there are 3 other screens listening to the same viewModel
            if (ModalRoute.of(context) != null && ModalRoute.of(context)!.isCurrent) {
              showCommonErrorDialog(context: context, exception: _loginViewModel.modelError);
              _loginViewModel.clearErrors();
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
                          const SizedBox(height: 16),
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
                  )),
            ),
          )),
        );
      },
    );
  }
}
