import 'package:flutter/material.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/presentation/common/widgets/settings_appbar.dart';
import 'package:speakyfox/presentation/screens/profile/my_purchases/my_purchases_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MyPurchasesScreen extends StatelessWidget {
  final MyPurchasesViewModel _myPurchasesViewModel = locator<MyPurchasesViewModel>();
  MyPurchasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => _myPurchasesViewModel,
        disposeViewModel: false,
        
        builder: (context, model, child) {
          if (_myPurchasesViewModel.hasError) {
            //handle errors
          }
          return  Scaffold(
            appBar: SettingsAppbar(
              title: "Meine Käufe",
            ),
            body:  Padding(
              padding: EdgeInsets.only(top: 20, bottom: 8.0, left: 8.0, right: 8.0),
              child: Card(child: Center(child: Text("MyPurchases"))),
            ),
          );
        });
  }
}
