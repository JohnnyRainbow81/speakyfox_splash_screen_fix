import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';

class StyleAssets {
  StyleAssets._();

  static Map<String, Style> getHTMLStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return {"h1": Style(fontSize: FontSize(textTheme.headline5!.fontSize), color: textTheme.headline5!.color),
     "h2": Style(fontSize: FontSize(textTheme.headline6!.fontSize), color: textTheme.headline6!.color),
     "h3": Style(fontSize: FontSize(textTheme.headline6!.fontSize),color: textTheme.headline6!.color),
     "p": Style(fontSize: FontSize(textTheme.bodyText1!.fontSize),color: textTheme.bodyText1!.color),
     };
  }
}
