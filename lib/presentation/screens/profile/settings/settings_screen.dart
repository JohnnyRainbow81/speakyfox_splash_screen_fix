import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/widgets/settings_appbar.dart';
import 'package:speakyfox/presentation/screens/profile/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsViewModel _settingsViewModel = locator<SettingsViewModel>();
  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: (() => _settingsViewModel),
        disposeViewModel: false,
        builder: (context, model, child) {
          if (_settingsViewModel.hasError) {
            //error handling
          }
          return Scaffold(
            appBar: SettingsAppbar(title: "Settings"),
            body: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8, left: 8, right: 8),
                child: Card(
                  child: Center(child: Text("Settings")),
                )),
          );
        });
  }
}
