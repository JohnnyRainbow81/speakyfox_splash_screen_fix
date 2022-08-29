// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool audioUnlocked = false;
  bool alreadyDisplayingUnlock = false;

  AudioService() {
    //Because setVolume doesn't work on my MacOs:
    if (Platform.isAndroid || Platform.isIOS) {
      _audioPlayer.setReleaseMode(ReleaseMode.stop);
      _audioPlayer.setPlayerMode(PlayerMode.lowLatency);
      _audioPlayer.setVolume(1);
    }

    if (kDebugMode) {
      _audioPlayer.onPlayerComplete.listen((event) {
        print("OnPlayerComplete");
      });
    }
  }

  // void playSound(dynamic item) {
  //   switch (item.runtimeType) {
  //     case Vocabulary:
  //       break;
  //     case Sentence:
  //       break;
  //   }
  // }

  Future<void> play(String soundAsset) async {
    await _audioPlayer.play(AssetSource(soundAsset), volume: 1);
    debugPrint("Done playing sound");
  }
}
