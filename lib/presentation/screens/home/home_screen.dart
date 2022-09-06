import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/resources/animation_assets.dart';
import 'package:speakyfox/presentation/common/widgets/errors/common_error_dialog.dart';
import 'package:speakyfox/presentation/screens/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: (() => _homeViewModel),
        builder: (context, model, child) {
          if (_homeViewModel.hasError) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              showCommonErrorDialog(
                  context: context, exception: _homeViewModel.modelError, animationAsset: AnimationAssets.error);
              _homeViewModel.clearErrors();
            });
          }
          // double height = MediaQuery.of(context).size.height;

          return Scaffold(
            body: Center(child: Text("HomeScreen")),
          );
        });
  }
}
