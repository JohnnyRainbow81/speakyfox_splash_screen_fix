import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/resources/image_assets.dart';
import 'package:speakyfox/presentation/common/routing.dart';
import 'package:speakyfox/presentation/screens/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileViewModel _profileViewModel = locator<ProfileViewModel>();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: (() => _profileViewModel),
        disposeViewModel: false,
        builder: (_, __, ___) {
          if (_profileViewModel.hasError) {
            //error handling
          }
          return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                // automaticallyImplyLeading: true,
                titleSpacing: 80,
                centerTitle: true,
                title: Image.asset(ImageAssets.speakyfoxLogo)),
            body: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
                child: Card(
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "App",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.shop),
                      title: const Text("Deine Käufe"),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () => GoRouter.of(context).push(Routing.myPurchases),
                    ),
                    ListTile(
                      leading:const Icon(Icons.lock_open),
                      title: const Text("Freischalten"),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () => GoRouter.of(context).push(Routing.unlock),
                    ),
                    ListTile(
                      leading:const Icon(Icons.settings),
                      title: const Text("Einstellungen"),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () => GoRouter.of(context).push(Routing.settings),
                    ),
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: const Text("Sprachauswahl"),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () => GoRouter.of(context).push(Routing.languageSelection),
                    ),
                    ListTile(
                      leading:const Icon(Icons.logout),
                      title: const Text("Logout"),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        _profileViewModel.logout();
                        GoRouter.of(context).replace(Routing.login);
                      },
                    )
                  ]),
                )),
          );
        });
  }
}
