import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/domain/models/language.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/domain/services/language_service.dart';
import 'package:speakyfox/presentation/common/resources/animation_assets.dart';
import 'package:speakyfox/presentation/common/routing.dart';
import 'package:speakyfox/presentation/common/widgets/errors/error_common_dialog.dart';
import 'package:speakyfox/presentation/screens/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();

  List<Language> languageList = [];

//delete, test only
  setLanguages(List<Language> list) {
    setState(() {
      languageList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: (() => _homeViewModel),
        builder: (context, model, child) {
          if (_homeViewModel.hasError) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              showErrorCommonDialog(
                  context: context, exception: _homeViewModel.modelError, animationAsset: AnimationAssets.error);
              _homeViewModel.clearErrors();
            });
          }
          // double height = MediaQuery.of(context).size.height;

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text("HomeScreen"),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await locator<AuthenticationService>().logout();
                 
                        GoRouter.of(context).go(Routing.login);
                 
                    },
                    child: const Text("logout")),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    onPressed: () async {
                      GoRouter.of(context).push(Routing.profile);
                      // List<Language> langs = await locator<LanguageService>().getSourceLanguages();
                      // setLanguages(langs);
                    },
                    child: const Text("profile screen")),
                languageList.isNotEmpty ? Text(languageList.toString()) : Container()
              ],
            ),
          );
        });
  }
}
