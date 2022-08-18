import 'package:audioplayers/audioplayers.dart';
import 'package:speakyfox/domain/models/sentence.dart';
import 'package:speakyfox/domain/models/vocabulary.dart';
import 'package:speakyfox/presentation/common/resources/sound_assets.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool audioUnlocked = false;
  bool alreadyDisplayingUnlock = false;

  void playSound(dynamic item) {
    switch (item.runtimeType) {
      case Vocabulary:
        break;
      case Sentence:
        break;
    }
  }

  void playSuccess() {
    _audioPlayer.play(AssetSource(SoundAssets.success));
  }

  void playCorrect() {
    _audioPlayer.play(AssetSource(SoundAssets.correct));
  }

  void playIncorrect() {
    _audioPlayer.play(AssetSource(SoundAssets.incorrect));
  }

}
