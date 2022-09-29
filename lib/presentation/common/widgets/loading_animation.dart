import 'dart:io';

import 'package:flutter/material.dart';
import '../resources/color_assets.dart';

class LoadingAnimation extends StatelessWidget {
  final double size;
  const LoadingAnimation({this.size = 24, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = Colors.transparent;
    if (Platform.isIOS) backgroundColor = ColorAssets.lightest;
    return RepaintBoundary(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2,
          backgroundColor: backgroundColor,
          valueColor: const AlwaysStoppedAnimation<Color>(ColorAssets.footerBlue),
        ),
      ),
    );
  }
}
