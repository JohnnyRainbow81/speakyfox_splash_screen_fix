import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:speakyfox/presentation/common/widgets/hint.dart';
import 'package:speakyfox/presentation/common/widgets/info_sheet.dart';
import 'package:speakyfox/presentation/common/widgets/loading_animation.dart';
import 'package:speakyfox/presentation/common/widgets/text_links.dart';
import 'package:speakyfox/presentation/screens/authentication/authentication_viewmodel.dart';
import 'package:speakyfox/presentation/screens/authentication/common/logo.dart';
import 'package:speakyfox/presentation/common/widgets/info_texts.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/dependency_injection.dart';
import '../../../common/routing.dart';
import '../../../common/widgets/errors/error_common_dialog.dart';

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

  @override
  void initState() {
    super.initState();

    _usernameController.text = _authenticationViewModel.usernameRegistration;
    _emailController.text = _authenticationViewModel.emailRegistration;
    _passwordController.text = "";

    _usernameController
        .addListener(() => _authenticationViewModel.validateUsernameRegistration(_usernameController.text));
    _passwordController
        .addListener(() => _authenticationViewModel.validatePasswordRegistration(_passwordController.text));
    _emailController.addListener(() => _authenticationViewModel.validateEmailRegistration(_emailController.text));

    //if textfields already contain data after screen initialisation > check if they're valid by triggering validation listeners manually once
    if (_usernameController.text.isNotEmpty) _usernameController.notifyListeners();
    if (_emailController.text.isNotEmpty) _emailController.notifyListeners();
    if (_passwordController.text.isNotEmpty) _passwordController.notifyListeners();

    _node.addListener(onTextFieldFocus);
  }

  @override
  void dispose() {
    debugPrint("RegistrationScreen.dispose()");

    _usernameController.removeListener(() => _authenticationViewModel.validateUsernameRegistration);
    _passwordController.removeListener(() => _authenticationViewModel.validatePasswordRegistration);
    _emailController.removeListener(() => _authenticationViewModel.validateEmailRegistration);

    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _scrollController.dispose();
    _node.removeListener(onTextFieldFocus);
    _node.dispose();

    super.dispose();
  }

  void onTextFieldFocus() {
    _authenticationViewModel.hasTextFieldFocus = _node.hasFocus;
  }

  void goToLoginScreen() {
    GoRouter.of(context).go(Routing.login);
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
              showErrorCommonDialog(context: context, exception: _authenticationViewModel.modelError);
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
                          padding: const EdgeInsets.only(top: 24.0, bottom: 12.0, left: 12.0, right: 12.0),
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                const Logo(),
                                // const SizedBox(
                                //   height: 32,
                                // ),
                                Text("Erstelle deinen Zugang",
                                    style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  enableInteractiveSelection: true,
                                  autofillHints: const [AutofillHints.name],
                                  decoration: InputDecoration(
                                      hintText: "Name",
                                      errorText: _authenticationViewModel.usernameRegistrationError,
                                      prefixIcon: const Icon(Icons.people)),
                                  controller: _usernameController,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: _node.nextFocus,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                    enableInteractiveSelection: true,
                                    autofillHints: const [AutofillHints.email],
                                    decoration: InputDecoration(
                                        hintText: "E-Mail",
                                        errorText: _authenticationViewModel.emailRegistrationError,
                                        prefixIcon: const Icon(Icons.email)),
                                    controller: _emailController,
                                    textInputAction: TextInputAction.next,
                                    onEditingComplete: _node.nextFocus),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  enableInteractiveSelection: true,
                                  autofillHints: const [AutofillHints.password],
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Passwort",
                                      errorText: _authenticationViewModel.passwordRegistrationError,
                                      errorMaxLines: 8,
                                      prefixIcon: const Icon(Icons.key)),
                                  controller: _passwordController,
                                  onEditingComplete: _node.unfocus,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                _authenticationViewModel.isRegistrationEmailSent
                                    ? const Hint("Wir haben dir eine Mail geschickt!")
                                    : Container(),
                                !_authenticationViewModel.busy(_authenticationViewModel.dataProtectionHTML)
                                    ? Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            value: _authenticationViewModel.isDataProtectionAccepted,
                                            onChanged: ((_) => _authenticationViewModel.toggleDataProtectionAccepted()),
                                          ),
                                          Flexible(
                                            child: TextLinks(
                                                textFirst: "Ich habe die ",
                                                textLinked: "Datenschutzbestimmungen",
                                                textSecond: " gelesen und bin damit einverstanden",
                                                textLinkedWidget: InfoSheet(
                                                    headline: "Datenschutzbestimmungen",
                                                    child: InfoTexts(
                                                        dataHTML: _authenticationViewModel.dataProtectionHTML))),
                                          )
                                        ],
                                      )
                                    : const LoadingAnimation(),
                                !_authenticationViewModel.busy(_authenticationViewModel.AGBsHTML)
                                    ? Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            value: _authenticationViewModel.isAGB_accepted,
                                            onChanged: ((_) => _authenticationViewModel.toggleAGB_accepted()),
                                          ),
                                          Flexible(
                                              child: TextLinks(
                                                  textFirst: "Ich habe die ",
                                                  textLinked: "AGB gelesen ",
                                                  textSecond: "und bin mit diesen einverstanden",
                                                  textLinkedWidget: InfoSheet(
                                                    headline: "Unsere AGBs",
                                                    child: InfoTexts(dataHTML: _authenticationViewModel.AGBsHTML),
                                                  )))
                                        ],
                                      )
                                    : const LoadingAnimation(),
                                const SizedBox(
                                  height: 16,
                                ),
                                ElevatedButton(
                                    onPressed: (_authenticationViewModel.isRegisterFormValid &&
                                            !_authenticationViewModel.isBusy)
                                        ? () async => _authenticationViewModel.register()
                                        : null,
                                    child: _authenticationViewModel.isBusy
                                        ? const LoadingAnimation()
                                        : const Text("Zugang erstellen")),
                                //const SizedBox(height: 16),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Hast du bereits einen Account?"),
                                    TextButton(onPressed: (() => goToLoginScreen()), child: const Text("Zum Login")),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
