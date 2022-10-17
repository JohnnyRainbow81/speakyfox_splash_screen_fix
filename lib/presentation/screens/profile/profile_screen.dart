

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/resources/image_assets.dart';
import 'package:speakyfox/presentation/common/routing.dart';
import 'package:speakyfox/presentation/common/widgets/errors/error_common_dialog.dart';
import 'package:speakyfox/presentation/screens/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileViewModel _profileViewModel = locator<ProfileViewModel>();
  bool? changePasswordSuccess;
  bool? cancelSubscriptionSuccess;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: (() => _profileViewModel),
        disposeViewModel: false,
        builder: (_, __, ___) {
          if (_profileViewModel.hasAnyError) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) { 
              //Check if this screen is current screen(=shown to the user) because
              //there are 3 other screens listening to the same viewModel
              showErrorCommonDialog(context: context, exception: _profileViewModel.currentError);
              _profileViewModel.clearErrors();
            });
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
                    leading: const Icon(Icons.lock_open),
                    title: const Text("Freischalten"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => GoRouter.of(context).push(Routing.unlock),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
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
                    leading: const Icon(Icons.logout),
                    title: const Text("Logout"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      _profileViewModel.logout();
                      GoRouter.of(context).replace(Routing.login);
                    },
                  ),

                  // TESTS ONLY

                  Container(
                    height: 8,
                    color: Colors.red,
                  ),
                  ListTile(
                    leading: const Icon(Icons.password),
                    title: const Text("ChangePassword throws 400"),
                    onTap: () async {
                      changePasswordSuccess =
                          await _profileViewModel.changePassword(currentPassword: "This will", newPassword: "not work");
                      setState(() {});
                    },
                  ),
                  _profileViewModel.isBusy
                      ? const LinearProgressIndicator()
                      : Text("Response from changePassword: $changePasswordSuccess"),
                  ListTile(
                    leading: const Icon(Icons.subscript),
                    title: const Text("getSubscriptions()"),
                    onTap: () {
                      _profileViewModel.getSubscriptions().then((value) => setState(() {}));
                    },
                  ),
                  _profileViewModel.busy(_profileViewModel.subscriptions)
                      ? const LinearProgressIndicator()                                                           
                      : Text("${_profileViewModel.subscriptions.toString()}"),
                  ListTile(
                    leading: const Icon(Icons.cancel),
                    title: const Text("cancelSubscription()"), 
                    onTap: () async {
                      _profileViewModel.cancelSubscription("dsfsdf").then((value) => setState(() {
                            cancelSubscriptionSuccess = value;
                          }));
                    },
                  ),
                  _profileViewModel.isBusy
                      ? const LinearProgressIndicator()
                      : Text("success: $cancelSubscriptionSuccess"),
                  ListTile(
                    leading: const Icon(Icons.cancel),
                    title: const Text("getLanguages()"),
                    onTap: () async {
                      _profileViewModel.getLanguages().then((value) => setState(() {}));
                    },
                  ),
                  Text("${_profileViewModel.sourceLanguage}"),
                  Text("${_profileViewModel.targetLanguage}"),
                  ListTile(
                    leading: const Icon(Icons.cancel),
                    title: const Text("getClasses()"),
                    onTap: () {
                      _profileViewModel.getClasses();
                    },
                  ),Text(_profileViewModel.classes.toString(),maxLines: 10,)
                ]),
                
              ),
            ),
          );
        });
  }
}
