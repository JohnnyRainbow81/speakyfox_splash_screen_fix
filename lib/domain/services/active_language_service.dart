// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:stacked/stacked.dart';

import 'package:speakyfox/domain/models/language.dart';

class ActiveLanguageService with ReactiveServiceMixin {
  //Ask Julien about functionality
  
   late Language _currentTargetLanguage;
   late Language _currentSourceLanguage;
  late ReactiveList<Language> _currentTargetLanguages;

  set setCurrentTargetLanguage(Language language) {
    _currentTargetLanguage = language;
  }

  set setCurrentSourceLanguage(Language language) {
    _currentSourceLanguage = language;
  }

}
