import 'package:speakyfox/domain/models/language.dart';

class ActiveLanguageService {
  //Ask Julien about functionality
  
  late Language _currentTargetLanguage;
  late Language _currentSourceLanguage;

  set setCurrentTargetLanguage(Language language) {
    _currentTargetLanguage = language;
  }

  set setCurrentSourceLanguage(Language language) {
    _currentSourceLanguage = language;
  }

}
