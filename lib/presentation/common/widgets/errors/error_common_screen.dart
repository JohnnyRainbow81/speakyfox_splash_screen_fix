// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

//This is the Last-Man-Standing-widget when when the CommonErrorDialog-widget cannot be build/shown anymore because
//the framework is in an erratic state.
class ErrorCommonScreen extends StatelessWidget {
  final Exception? exception;
  final String message;
  final String? path;
  final String? details;
  static const double animSize = 150;

  const ErrorCommonScreen({
    Key? key,
    this.path,
    this.details,
    this.exception,
    this.message =
        "An unexpected error happened. Sorry! \n\n Please refresh or try to navigate to another screen. If that's not possible, please start the app again.",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.maybeOf(context)?.size.width;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: (width ?? 300) * 0.65, child: Text(message, textAlign: TextAlign.center)),
          const SizedBox(
            height: 64,
          ),
          exception != null
              ? SizedBox(
                  width: (width ?? 300) * 0.65,
                  child: Text("ExceptionType : ${exception.runtimeType.toString()}", textAlign: TextAlign.center))
              : const SizedBox.shrink(),
          path != null
              ? SizedBox(width: (width ?? 300) * 0.65, child: Text("path: $path", textAlign: TextAlign.center))
              : const SizedBox.shrink(),
          const SizedBox(
            height: 64,
          ),
          details != null
              ? SizedBox(width: (width ?? 300) * 0.65, child: Text("details: $details", textAlign: TextAlign.center))
              : const SizedBox.shrink(),
          const SizedBox(
            height: 64,
          ),
        ],
      )),
    );
  }
}
