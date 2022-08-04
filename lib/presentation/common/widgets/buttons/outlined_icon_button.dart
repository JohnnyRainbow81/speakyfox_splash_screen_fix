import 'package:flutter/material.dart';

class OutlinedIconButton extends StatelessWidget {
  final double? size;
  final IconData icon;
  final VoidCallback? action;

  const OutlinedIconButton(
    this.icon, {
    Key? key,
    this.action,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: action ?? () {},
        child: Icon(
          icon,
          size:  size ?? Theme.of(context).iconTheme.size
        ));
  }
}
