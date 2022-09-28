import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';

class InfoSheet extends StatelessWidget {
  final String headline;
  final Widget child;

  const InfoSheet({required this.headline, required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 24, bottom: 0),
      child: Scaffold(
          appBar: AppBar(
              title: Text(
                headline,
                style: Theme.of(context).textTheme.headline5,
              ),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              bottomOpacity: 0.0,
              toolbarOpacity: 1.0,
              elevation: 2,
              shadowColor: ColorAssets.primary.withOpacity(0.15),
              backgroundColor: Theme.of(context).backgroundColor,
              iconTheme: Theme.of(context).iconTheme.copyWith(color: ColorAssets.primary)),
          body: child),
    );
  }
}
