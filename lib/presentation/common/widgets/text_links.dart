import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:speakyfox/presentation/common/resources/themes.dart';

class TextLinks extends StatelessWidget {
  final String? textFirst;
  final String? textSecond;
  final String textLinked;
  final Widget widgetBehindLink;

  const TextLinks(
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