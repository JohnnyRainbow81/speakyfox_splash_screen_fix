import 'package:flutter/material.dart';
import 'package:speakyfox/presentation/common/resources/image_assets.dart';
import 'package:speakyfox/presentation/screens/authentication/authentication_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Logo extends ViewModelWidget<AuthenticationViewModel> {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AuthenticationViewModel viewModel) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.topCenter,
      curve: Curves.decelerate,
      child: Image.asset(
        ImageAssets.speakyfoxLogo,
        width: MediaQuery.of(context).size.width * 0.75,
        height: viewModel.hasTextFieldFocus ? 0 : MediaQuery.of(context).size.height * 0.15,
      ),
    );
  }
}
