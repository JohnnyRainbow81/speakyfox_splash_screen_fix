// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:stacked/stacked.dart';

import 'package:speakyfox/domain/models/lecture.dart';
import 'package:speakyfox/domain/models/screen.dart';

enum ButtonType { check, continuee }

class GameSequence {
  bool isCompleted = false;
  bool hasMultipleSequences = false;
  int sequenceIndex = 0;
  ButtonType buttonType = ButtonType.continuee;
}

class GameSequenceService with ReactiveServiceMixin {
  Lecture lecture;
  ReactiveValue<dynamic> _checkGameSolution = ReactiveValue(0);
  ReactiveValue<bool> _gameIsCorrect = ReactiveValue(false);
  ReactiveValue<GameSequence> _gameSequence;
  Screen _currentScreen;

  GameSequenceService(
    this.lecture,
    this._gameSequence,
    this._currentScreen,
  ) {
    listenToReactiveValues([checkGameSolution, _gameIsCorrect, _gameSequence]);
  }

  bool canHandle(Screen screen) {
    return screen.id == _currentScreen.id;
  }

  void next() {
    _gameSequence.value.sequenceIndex++;
  }

  void hasMultipleSequences([bool multiple = false]) {
    _gameSequence.value.hasMultipleSequences = multiple;
  }

  void setCurrentScreen(Screen currentScreen) {
    _gameSequence = ReactiveValue<GameSequence>(GameSequence());
    _currentScreen = currentScreen;
  }

  void checkGameSolution() {
    throw UnimplementedError();
  }

  void setGameSolution() {
    throw UnimplementedError();
  }
}
