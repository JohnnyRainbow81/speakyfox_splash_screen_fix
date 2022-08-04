// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

//This is the Last-Man-Standing-widget when when the CommonErrorDialog-widget cannot be build/shown anymore because
//the framework is in an erratic state.
class CommonErrorWidget extends StatelessWidget {
  final String message;
  static const double animSize = 150;

  const CommonErrorWidget({
    Key? key,
    this.message = "An unexpected error happened. Sorry! \n Please refresh or try to navigate to another screen. If that's not possible, please start the app again.",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.maybeOf(context)?.size.width;
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: (width ?? 300) *0.65,
            child: Text(message, textAlign: TextAlign.center)),
      ],
    ));
  }
}
