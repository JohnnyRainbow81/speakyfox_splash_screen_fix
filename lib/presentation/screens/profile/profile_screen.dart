import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/resources/image_assets.dart';
import 'package:speakyfox/presentation/common/routes.dart';
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
                padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
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
                      onTap: () => Navigator.of(context).pushNamed(Routes.myPurchases),
                    ),
                    ListTile(
                      leading: Icon(Icons.lock_open),
                      title: const Text("Freischalten"),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed(Routes.unlock),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: const Text("Einstellungen"),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed(Routes.settings),
                    ),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: const Text("Sprachauswahl"),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed(Routes.languageSelection),
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: const Text("Logout"),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        _profileViewModel.logout();
                        Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);
                      },
                    )
                  ]),
                )),
          );
        });
  }
}
