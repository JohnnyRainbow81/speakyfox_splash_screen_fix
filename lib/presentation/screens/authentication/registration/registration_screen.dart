import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';
import 'package:speakyfox/presentation/common/resources/image_assets.dart';
import 'package:speakyfox/presentation/common/widgets/hint.dart';
import 'package:speakyfox/presentation/common/widgets/loading_animation.dart';
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
  final AuthenticationViewModel _authenticationViewModel = locator<AuthenticationViewModel>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  final FocusScopeNode _node = FocusScopeNode();

  final _formKey = GlobalKey<FormState>();
  String? usernameError;
  String? passwordError;
  String? emailError;

  @override
  void initState() {
    super.initState();
    _usernameController.text = _authenticationViewModel.username;
    _emailController.text = _authenticationViewModel.email;
    _passwordController.text = _authenticationViewModel.password;

    _usernameController.addListener(() => _authenticationViewModel.validateUsername(_usernameController.text));
    _passwordController.addListener(() => _authenticationViewModel.validatePassword(_passwordController.text));
    _emailController.addListener(() => _authenticationViewModel.validateEmail(_emailController.text));

    _authenticationViewModel.allRegistrationInputsAreValid = onAllRegistrationInputsAreValid;
  }

  @override
  void dispose() {
    debugPrint("RegistrationScreen.dispose()");

    _usernameController.removeListener(() => _authenticationViewModel.validateUsername);
    _passwordController.removeListener(() => _authenticationViewModel.validatePassword);
    _emailController.removeListener(() => _authenticationViewModel.validateEmail);

    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _scrollController.dispose();
    _node.dispose();

    _authenticationViewModel.allRegistrationInputsAreValid = null;
    super.dispose();
  }

  void onAllRegistrationInputsAreValid() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.initialScrollOffset,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("RegistrationScreen.build()");
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => _authenticationViewModel,
      disposeViewModel: false,
      builder: (context, _, child) {
        if (_authenticationViewModel.hasError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            //Check if this screen is current screen(==is shown to the user) because
            //there are 3 other screens listening to the same viewModel
            if (ModalRoute.of(context) != null && ModalRoute.of(context)!.isCurrent) {
              showCommonErrorDialog(context: context, exception: _authenticationViewModel.modelError);
              _authenticationViewModel.clearErrors();
            }
          });
        }
        //needed for preventing user to dismiss screen by swiping left and ending up in nomansland
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
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
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(ImageAssets.speakyfoxLogo),
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
                                autofillHints: const [AutofillHints.name],
                                decoration: InputDecoration(
                                    hintText: "Name",
                                    errorText: _authenticationViewModel.userNameError,
                                    prefixIcon: const Icon(Icons.people)),
                                controller: _usernameController,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: _node.nextFocus,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                  autofillHints: const [AutofillHints.email],
                                  decoration: InputDecoration(
                                      hintText: "E-Mail",
                                      errorText: _authenticationViewModel.emailError,
                                      prefixIcon: const Icon(Icons.email)),
                                  controller: _emailController,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: _node.nextFocus),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                autofillHints: const [AutofillHints.password],
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Passwort",
                                    errorText: _authenticationViewModel.passwordError,
                                    errorMaxLines: 8,
                                    prefixIcon: const Icon(Icons.key)),
                                controller: _passwordController,
                                onEditingComplete: _node.nextFocus,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              _authenticationViewModel.isRegistrationEmailSent
                                  ? const Hint("Wir haben dir eine Mail geschickt!")
                                  : Container(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: _authenticationViewModel.isDataProtectionAccepted,
                                    onChanged: ((_) => _authenticationViewModel.toggleDataProtectionAccepted()),
                                  ),
                                  const Flexible(
                                      child: Text(
                                    "Ich habe die Datenschutzbestimmung gelesen und bin damit einverstanden",
                                    maxLines: 3,
                                  ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: _authenticationViewModel.isAGB_accepted,
                                    onChanged: ((_) => _authenticationViewModel.toggleAGB_accepted()),
                                  ),
                                  const Flexible(
                                      child: Text(
                                    "Ich habe die AGB gelesen und bin mit diesen einverstanden",
                                    maxLines: 3,
                                  ))
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ElevatedButton(
                                  /* onPressed: (!_authenticationViewModel.isLoggedIn &&
                                        !_authenticationViewModel.isBusy &&
                                        _authenticationViewModel.isLoginFormValid)
                                    ? () async => _authenticationViewModel
                                        .login()
                                        .then((isLoggedIn) => isLoggedIn ? goToNextScreen() : null)
                                    : null, //Needs to be null to show as a disabled button */
                                  onPressed:
                                      (_authenticationViewModel.isRegisterFormValid && !_authenticationViewModel.isBusy)
                                          ? () async => _authenticationViewModel.register()
                                          : null,
                                  child: _authenticationViewModel.isBusy
                                      ? const LoadingAnimation()
                                      : const Text("Zugang erstellen")),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Hast du bereits einen Account?"),
                                  TextButton(
                                      onPressed: () => Navigator.of(context).pushNamed(Routes.login),
                                      child: const Text("Zum Login")),
                                ],
                              ),
                            ],
                          ),
                        ),
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


