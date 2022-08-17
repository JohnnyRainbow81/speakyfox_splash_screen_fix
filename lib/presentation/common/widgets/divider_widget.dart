import 'package:flutter/material.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 1, color: ColorAssets.primary.withOpacity(0.3), height: 0);
  }
}
