import 'dart:io';

import 'package:flutter/material.dart';
import '../resources/color_assets.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = Colors.transparent;
    if (Platform.isIOS) backgroundColor = ColorAssets.primary;
    return RepaintBoundary(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 2,
        backgroundColor: backgroundColor,
        valueColor: const AlwaysStoppedAnimation<Color>(ColorAssets.primary),
      ),
    );
  }
}
