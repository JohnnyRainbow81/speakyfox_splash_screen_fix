import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/widgets/settings_appbar.dart';
import 'package:speakyfox/presentation/screens/profile/unlock/unlock_viewmodel.dart';
import 'package:stacked/stacked.dart';

class UnlockScreen extends StatelessWidget {
  final UnlockViewModel _unlockViewModel = locator<UnlockViewModel>();
  UnlockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => _unlockViewModel,
      disposeViewModel: false,
      builder: (context, model, child) {
        if (_unlockViewModel.hasError) {
          //handle Errors
        }
        return Scaffold(
          appBar: SettingsAppbar(title: "Freischalten",),
          body: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 8, left: 8, right: 8),
              child: Card(
                child: Center(child: Text("Unlock")),
              )),
        );
      },
    );
  }
}

