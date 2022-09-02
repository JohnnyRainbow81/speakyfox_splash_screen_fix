import 'package:flutter/material.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';
import 'package:speakyfox/presentation/screens/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SFTextField extends ViewModelWidget<LoginViewModel> {
  final IconData iconData;
  final String hintText;
  final TextEditingController controller;
  final String? error;

  const SFTextField({required this.iconData, required this.controller, required this.hintText, Key? key, required this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    debugPrint("build");
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: hintText,
          suffixIcon: const Icon(Icons.check, color: ColorAssets.grGreenLight),
          /* errorText: "error text" */
          errorText: error),
      controller: controller,
      autovalidateMode: AutovalidateMode.always,
    );
  }
}


//Border.all(color: ColorAssets.headlineBlue)