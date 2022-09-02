import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';

class SFTextField extends StatefulWidget {
  final IconData iconData;
  final String hintText;
  final TextEditingController controller;
  const SFTextField({required this.iconData, required this.controller, required this.hintText, Key? key})
      : super(key: key);

  @override
  State<SFTextField> createState() => _SFTextFieldState();
}

class _SFTextFieldState extends State<SFTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(widget.iconData),
        hintText: widget.hintText,
        suffixIcon: const Icon(Icons.check, color: ColorAssets.grGreenLight), /* errorText: "error text" */
      ),
      controller: widget.controller,
    );
  }
}


//Border.all(color: ColorAssets.headlineBlue)