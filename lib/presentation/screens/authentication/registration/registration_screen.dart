import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:speakyfox/app/utilities.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';
import 'package:speakyfox/presentation/common/resources/image_assets.dart';
import 'package:speakyfox/presentation/common/resources/themes.dart';
import 'package:speakyfox/presentation/common/widgets/hint.dart';
import 'package:speakyfox/presentation/common/widgets/loading_animation.dart';
import 'package:speakyfox/presentation/screens/authentication/authentication_viewmodel.dart';
import 'package:speakyfox/presentation/screens/authentication/common/logo.dart';
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

    _usernameController.addListener(() => _authenticationViewModel.validateUsername(_usernameController.text));
    _passwordController.addListener(() => _authenticationViewModel.validatePassword(_passwordController.text));
    _emailController.addListener(() => _authenticationViewModel.validateEmail(_emailController.text));

    _authenticationViewModel.allRegistrationInputsAreValid = onAllRegistrationInputsAreValid;
    _node.addListener(onTextFieldFocus);
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
    _node.removeListener(onTextFieldFocus);
    _node.dispose();

    _authenticationViewModel.allRegistrationInputsAreValid = null;
    super.dispose();
  }

  void onAllRegistrationInputsAreValid() {
    // if (_scrollController.hasClients) {
    //   _scrollController.animateTo(_scrollController.initialScrollOffset,
    //       duration: const Duration(seconds: 1), curve: Curves.ease);
    // }
  }

  // Let the ViewModel know about focus changes to inform the
//Speakyfox Logo, which is seperate widget, about focus changes.
  void onTextFieldFocus() {
    _authenticationViewModel.hasTextFieldFocus = _node.hasFocus;
  }

  void goToLoginScreen() {
    Navigator.pushNamed(context, Routes.login);
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
                                    enableInteractiveSelection: true,
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
                                  enableInteractiveSelection: true,
                                  autofillHints: const [AutofillHints.password],
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Passwort",
                                      errorText: _authenticationViewModel.passwordError,
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
                                    Flexible(
                                        child: TextWithLinks(
                                      textFirst: "Ich habe die ",
                                      textLinked: "AGB gelesen ",
                                      textSecond: "und bin mit diesen einverstanden",
                                      widgetBehindLink: InformationSheet(data: _authenticationViewModel.AGBs),
                                    ) /* Text(
                                      "Ich habe die AGB gelesen und bin mit diesen einverstanden",
                                      maxLines: 3,
                                    ) */
                                        )
                                  ],
                                ),
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

class TextWithLinks extends StatelessWidget {
  final String? textFirst;
  final String? textSecond;
  final String textLinked;
  final Widget widgetBehindLink;

  const TextWithLinks(
      {this.textFirst, required this.textLinked, this.textSecond, required this.widgetBehindLink, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: textFirst, style: Theme.of(context).textTheme.bodyText2, children: [
        TextSpan(
          text: textLinked,
          style: getUnderlinedTextStyle(),
          recognizer: TapGestureRecognizer()
            ..onTap = () => showModalBottomSheet(
                isDismissible: true,
                enableDrag: true,
                isScrollControlled: true,
                context: context,
                builder: (context) => widgetBehindLink),
        ),
        TextSpan(text: textSecond)
      ]),
    );
  }
}

class InformationSheet extends StatelessWidget {
  Map<String, dynamic> data;
  InformationSheet({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 24, bottom: 0),
      child: Scaffold(
          appBar: AppBar(
              
              title: Text(
                "Unsere AGBs",
                style: Theme.of(context).textTheme.headline5,
              ),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              bottomOpacity: 0.0,
              toolbarOpacity: 1.0,
              elevation: 2,
              shadowColor: ColorAssets.primary.withOpacity(0.15),
              backgroundColor: Theme.of(context).backgroundColor,
              iconTheme: Theme.of(context).iconTheme.copyWith(color: ColorAssets.primary)),
          body: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...data.entries.map((e) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.key,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Flexible(
                              child: Text(
                            e.value,
                            maxLines: 50,
                            softWrap: true,
                          ))
                        ],
                      ),
                    ))
              ],
            ),
          ))),
    );
  }
}
