import 'package:speakyfox/domain/models/language.dart';
import 'package:speakyfox/domain/services/active_language_service.dart';
import 'package:speakyfox/domain/services/user_service.dart';
import 'package:stacked/stacked.dart';

class LanguageSelectionViewModel extends BaseViewModel {
  final ActiveLanguageService _activeLanguageService;
  final UserService _userService;

  late Language _currentLanguage;
  late Language _targetLanguage;

  LanguageSelectionViewModel(this._activeLanguageService, this._userService);

  void onInit() {
    //get users current source / target languages
    //_userService.getCurrentUser();
  }
}
