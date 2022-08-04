import 'package:flutter/material.dart';

class KeywordsWidget extends StatelessWidget {
  final List<String> keywords;

  const KeywordsWidget(this.keywords, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> keywordsList = [];
    for (int i = 0; i < keywords.length; i++) {
      keywordsList.add(Text(keywords[i]));
      if (i != keywords.length - 1) {
        keywordsList.add(const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text("|"),
        ));
      }
    }
    //Constrain the width to something like 2/3 screen width
    return ConstrainedBox(
      constraints: BoxConstraints.loose(Size(MediaQuery.of(context).size.width * 0.66, 30)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: keywordsList,
      ),
    );
  }
}
