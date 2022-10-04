import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsAppbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const SettingsAppbar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: Theme.of(context).iconTheme,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        centerTitle: true,
        title: Text(
         title,
          style: Theme.of(context).textTheme.headline5,
        ) //Image.asset(ImageAssets.speakyfoxLogo)
        );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
