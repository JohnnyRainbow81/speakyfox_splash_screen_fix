import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:speakyfox/presentation/common/resources/styles.dart';

class InfoTexts extends StatelessWidget {
  final dom.Document? dataHTML;

  const InfoTexts({
    Key? key,
    this.dataHTML,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: dataHTML != null
          ? Html.fromDom(
              style: StyleAssets.getHTMLStyle(context),
              document: dataHTML,
            )
          : const Text("Daten konnten nicht geladen werden"),
    ));
  }
}
