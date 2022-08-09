import 'package:flutter/material.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';

class ListTileWidget extends StatelessWidget {
  final String text;
  final IconData iconLeading;
  final Function action;

  const ListTileWidget({
    Key? key,
    required this.text,
    required this.iconLeading,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal:8),
      leading: Icon(
        iconLeading,
        color: ColorAssets.primary,
        size: 28,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: const Icon(Icons.arrow_forward, color: ColorAssets.primary, size: 16),
      onTap: action(),
    );
  }
}
