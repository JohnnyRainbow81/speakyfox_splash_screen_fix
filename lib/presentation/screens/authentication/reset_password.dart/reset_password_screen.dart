import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';
import 'package:speakyfox/presentation/common/resources/image_assets.dart';
import 'package:speakyfox/presentation/common/widgets/hint.dart';
import 'package:speakyfox/presentation/common/widgets/loading_animation.dart';
import 'package:speakyfox/presentation/screens/authentication/authentication_viewmodel.dart';
import '../../../../app/dependency_injection.dart';
import '../../../common/widgets/errors/error_common_dialog.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final AuthenticationViewModel _authenticationViewModel = locator<AuthenticationViewModel>();

  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    //_authenticationViewModel.reset();
    _emailController.text = _authenticationViewModel.emailLogin;
  }

  @override
  void dispose() {
    debugPrint("ResetPasswordScreen.dispose()");
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("ResetPasswordScreen.build() ");

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => _authenticationViewModel,
      disposeViewModel: false,
      builder: (context, _, child) {
        if (_authenticationViewModel.hasError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            //Check if this screen is current screen(=shown to the user) because
            //there are 3 other screens listening to the same viewModel
            if (ModalRoute.of(context) != null && ModalRoute.of(context)!.isCurrent) {
              showErrorCommonDialog(context: context, exception: _authenticationViewModel.modelError);
              _authenticationViewModel.clearErrors();
            }
          });
        }
        return Scaffold(
          body: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 8.0, left: 8.0, right: 8.0),
            child: Card(
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 36),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(ImageAssets.speakyfoxLogo),
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
                          keyboardType: TextInputType.emailAddress,
                          enableInteractiveSelection: true,
                          autofillHints: const [AutofillHints.email],
                          decoration: InputDecoration(
                              hintText: "E-Mail",
                              errorText: _authenticationViewModel.emailLoginError,
                              prefixIcon: const Icon(Icons.email)),
                          controller: _emailController,
                          onEditingComplete: () => _emailController.text = _authenticationViewModel.emailLogin,

                        ),
                        _authenticationViewModel.isLoggedIn
                            ? const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text("Wir haben dir eine Email geschickt"),
                              )
                            : Container(),
                        const SizedBox(
                          height: 16,
                        ),
                        _authenticationViewModel.isResetEmailSent && !_authenticationViewModel.canSendEmail
                            ? const Hint("Email wurde verschickt!")
                            : Container(),
                        const SizedBox(
                          height: 24,
                        ),
                        ElevatedButton(
                            onPressed:
                                _authenticationViewModel.canSendEmail ? _authenticationViewModel.sendResetEmail : null,
                            child: _authenticationViewModel.isBusy
                                ? const LoadingAnimation()
                                : _authenticationViewModel.isResetEmailSent && _authenticationViewModel.canSendEmail
                                    ? const Text("Nochmal senden")
                                    : !_authenticationViewModel.canSendEmail
                                        ? Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                                const Text("Bitte warten "),
                                                Text(_authenticationViewModel.waitTime)
                                              ])
                                        : const Text("Email versenden")),
                        const Spacer(),
                        //const SizedBox(height: 48,),
                        TextButton(
                            onPressed: () => GoRouter.of(context).pop(), //to Login Screen
                            child: const Text("Zurück zum Login")),
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
