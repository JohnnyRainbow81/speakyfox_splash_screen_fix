import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/widgets/settings_appbar.dart';
import 'package:speakyfox/presentation/screens/profile/language_selection/language_selection_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final LanguageSelectionViewModel _languageSelectionViewModel = locator<LanguageSelectionViewModel>();

  LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => _languageSelectionViewModel,
      disposeViewModel: false,
      builder: (context, model, child) {
        if (_languageSelectionViewModel.hasError) {
          //handle error
        }
        return Scaffold(
          appBar: SettingsAppbar(title: "Sprachauswahl"),
          body: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 8, left: 8, right: 8),
              child: Card(
                child: Center(child: Text("LanguageSelection")),
              )),
        );
      },
    );
  }
}
