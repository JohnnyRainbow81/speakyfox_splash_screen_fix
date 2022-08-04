import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/animation_assets.dart';

class AnimatedDialogIcon extends StatelessWidget {
  final String? asset;
  const AnimatedDialogIcon({this.asset = AnimationAssets.error, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getIcon(asset);
  }

//Unfortunately this per-case Lottie asset handling is necessary
//because the Lottie assets come with different croppings!
//So Padding etc. must be decided on a per-icon-basis
  _getIcon(String? asset) {
    switch (asset) {
      case null: //Return standard error anim(Its cropping is messed up, so we have to use SizedBox/OverflowBox)
        return SizedBox(
            height: 80,
            width: 80,
            child: OverflowBox(
                //Hack because anim has too much widespace
                maxWidth: 300,
                maxHeight: 300,
                child: Lottie.asset(asset ?? AnimationAssets.error, width: 150, height: 150,)));
      case AnimationAssets.failed:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Lottie.asset(asset!, width: 64, height: 64),
        );
      default:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Lottie.asset(asset!, width: 64, height: 64),
        );
    }
  }
}
