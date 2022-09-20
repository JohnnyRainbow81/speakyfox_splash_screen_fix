import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';
import 'package:speakyfox/presentation/common/resources/image_assets.dart';
import 'package:speakyfox/presentation/common/widgets/hint.dart';
import 'package:speakyfox/presentation/screens/authentication/authentication_viewmodel.dart';
import '../../../../app/dependency_injection.dart';
import '../../../common/widgets/errors/common_error_dialog.dart';
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

  double scale = 1.0;

  @override
  void initState() {
    super.initState();
    _authenticationViewModel.reset();
    _emailController.text = _authenticationViewModel.email;
    _emailController.addListener(() => _authenticationViewModel.validateEmail(_emailController.text));
  }

  @override
  void dispose() {
    debugPrint("ResetPasswordScreen.dispose()");
    _emailController.removeListener(() => _authenticationViewModel.validateEmail);
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
              showCommonErrorDialog(context: context, exception: _authenticationViewModel.modelError);
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
                          autofillHints: const [AutofillHints.email],
                          decoration: InputDecoration(
                              hintText: "E-Mail",
                              errorText: _authenticationViewModel.emailError,
                              prefixIcon: const Icon(Icons.email)),
                          controller: _emailController,
                        ),
                        _authenticationViewModel.isLoggedIn
                            ? const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text("Wir haben dir eine Email geschickt"),
                              )
                            : Container(),
                            const SizedBox(height: 16,),
                        _authenticationViewModel.isResetEmailSent
                            ? AnimatedScale(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.ease,
                                onEnd: () => setState(() => scale = 1.0),
                                scale: scale,
                                child: const Hint( "Email wurde verschickt!"))
                            : Container(),
                        const SizedBox(
                          height: 24,
                        ),
                        ElevatedButton(
                            onPressed: _authenticationViewModel.isEmailFormValid
                                ? () {
                                    setState(() => scale = 1.1);
                                    _authenticationViewModel.sendResetEmail();
                                  }
                                : null,
                            child: _authenticationViewModel.isResetEmailSent
                                ? const Text("Nochmal senden")
                                : const Text("Email versenden")),
                        const Spacer(),
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(), //to Login Screen
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

// class Hint extends StatelessWidget {
//   final String text;
//   final IconData? iconData;
//   final Color? color;
//   const Hint({
//     required this.text,
//     this.iconData,
//     this.color,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(text),
//           Icon(
//             iconData ?? Icons.check,
//             color: color ?? ColorAssets.markupGreen,
//           )
//         ],
//       ),
//     );
//   }
// }
