import 'package:flutter/material.dart';

import '../../common/resources/color_assets.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      //TODO fade out when leaves screen
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.transparent, ColorAssets.black54],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      ),
    );
  }
}
