import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/presentation/common/resources/animation_assets.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';
import 'package:speakyfox/presentation/common/routing.dart';
import 'package:speakyfox/presentation/common/widgets/animated_dialog_icon.dart';

//The go-to method for presenting errors/exceptions to the user as a [Dialog].
Future<void> showErrorCommonDialog(
    {required BuildContext context, dynamic exception, Function? action, String? actionText, String? animationAsset}) {
  //if no [exception] was handed over here, show a basic UIException
  if (exception == null) {
    UIException showInUIException = UIException();
    exception = showInUIException;
  }

  //We differentiate between UIException, Exception and Error.
  //We try to funnel every Exception as a UIException(for transparent/better UX) into here, but there
  //might arrive other Exceptions we weren't able to catch & map into an UIException upfront.
  //
  //If [Error]s arrive here (which could but shouldn't happen), we let the user exit from the app by pressing a button.
  //This might be (at least) a better UX than just crashing the app.

  if (exception is UIException) {
    //Handle [UIException]-types
    switch (exception.runtimeType) {
      //some global error handling if [onButtonPress]-callback is not provided in function parameters
      case CannotRecoverUIException:
        //restarts the app
        //careful here! The app restarts, but the dependency injection(via Get_it lib) cannot be restarted,
        //because it's initialized outside of the Phoenix.rebirth-scope!
        action = () => Future.delayed(const Duration(seconds: 1), () => Phoenix.rebirth(context));
        animationAsset = AnimationAssets.failed;
        actionText = "Restart";
        break;
      case LoggedOutException:
        action = () => GoRouter.of(context).go(Routing.login);
        actionText = "To Login";
        break;
    }

    return showDialog(
        context: context,
        builder: (context) => _ErrorCommonDialog(
              animationAsset: animationAsset,
              headline: exception?.message,
              subline: exception?.description,
              action: action,
              actionText: actionText ?? "Okay",
            ));
  } else if (exception is Exception) {
    //Handle more general [Exception]-types (other than [UIException])
    return showDialog(
        context: context,
        builder: (context) => _ErrorCommonDialog(
              animationAsset: animationAsset,
              headline: "Exception happened",
              subline:
                  "Something unexpected happened we need to dig into. If you experience strange behavior, please restart the app.",
              actionText: actionText ?? "Okay",
            ));
  } else {
    //Handle [Error]-types

    //The web says: [Error]s shouldn't be caught because they have faulty reasons caused by 'the' programmer.
    //They should be fixed and should not occur in release.

    //I think: Nevertheless it might be a good idea to at least let the user know that something happened we fucked up and the app cannot recover from.

    // So if [exception] is a fatal [Error], the app will not be able to show the [CommonErrorDialog] but a fallback like the [CommonErrorWidget],
    //(It's a simple text widget the framework might still show in erratic circumstances).

    //Otherwise if the framework is still able to handle the [CommonErrorDialog] there will be an error message and a button the user can
    //press to exit the app.

    //So if the following [CommonErrorDialog]-build() fails, the [CommonErrorWidget]-fallback shows up.
    return showDialog(
        context: context,
        builder: (context) => _ErrorCommonDialog(
              animationAsset: AnimationAssets.failed,
              headline: "Oh no. It's bad.",
              subline: "Something unexpected happened which our app couldn't recover from.\nPlease restart the app.",
              action: () => Future.delayed(const Duration(seconds: 1), () => exit(1)),
              actionText: "Exit",
            ));
  }
}

class _ErrorCommonDialog extends StatefulWidget {
  final String? animationAsset;
  final String headline;
  final String subline;
  final String actionText;
  final Function? action;

  const _ErrorCommonDialog(
      {Key? key,
      this.animationAsset,
      required this.actionText,
      required this.headline,
      required this.subline,
      this.action})
      : super(key: key);

  @override
  State<_ErrorCommonDialog> createState() => _ErrorCommonDialogState();
}

class _ErrorCommonDialogState extends State<_ErrorCommonDialog> {
  double _scale = 1.0;

  void _triggerAnim() {
    setState(() {
      _scale = 1.05;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 100),
      scale: _scale,
      curve: Curves.ease,
      onEnd: () => setState(() {
        _scale = 1.0;
      }),
      child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 1.5,
          child: Container(
            decoration: BoxDecoration(
                color: ColorAssets.bgBlueLight,
                shape: BoxShape.rectangle,
                //border: Border.all(width: 1.5, color: ColorAssets.primary),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 12))]),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedDialogIcon(asset: widget.animationAsset),
                        Expanded(
                          child: Text(
                            widget.headline,
                            softWrap: false,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headline6,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.subline,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _triggerAnim();
                            //FIXME Because GoRouter.pop() gives us an Exception when we pop the Dialog with the following
                            //message we use good old Navigator.pop() here:
                            //"You have popped the last page off of the stack, there are no pages left to show
                           // 'package:go_router/src/matching.dart':" 
                           // See also https://github.com/flutter/flutter/issues/100933
                            widget.action == null ? Navigator.of(context).pop() : widget.action!();
                          },
                          child: Text(widget.actionText),
                        ),
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}