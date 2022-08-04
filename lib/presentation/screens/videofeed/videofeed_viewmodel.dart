import 'package:flutter/foundation.dart';
import 'package:flutter_starterkit/app/error_handling/exceptions_ui.dart';
import '../../../app/constants.dart';
import '../../../domain/services/preferences_service.dart';
import '../../../domain/services/videofeed_service.dart';
import 'package:stacked/stacked.dart';

import 'video_playable.dart';

class VideoFeedViewModel extends BaseViewModel {
  final VideoFeedService _videoFeedService;
  final PreferencesService _preferencesService;
  
  List<VideoPlayable> _currentVideos = [];

  int _currentScreen = 0;
  int _retries = 0;
  String? _address;
  bool _isFirstTime = true;
  bool _isInitialized = false;
  bool _isVideoReady = false;

  VideoFeedViewModel(this._videoFeedService, this._preferencesService);

  int get videoCount => _currentVideos.length;
  int get currentScreen => _currentScreen;
  bool get hasVideos => _currentVideos.isNotEmpty;
  bool get isVideoReady => _isVideoReady; //Just for fading in first video via AnimatedOpacity
  bool get isFirstTime => _isFirstTime;
  String get address => _address ?? "";
  String get companyId {
    return _currentVideos[currentScreen].video.companyId;
  }

  Future<void> init() async {
    //runBusyFuture runs setState() under the hood! This is the reason we have to call
    //init() AFTER the build() function has already run for a first time in the widget to not
    //disturb the build()-method
    if (!_isInitialized) {
      _isFirstTime = await runBusyFuture(_preferencesService.loadIsFirstTimeAppLaunced());

      _isVideoReady = false;
      //IMPORTANT: The video pixel data won't be loaded here! Only the meta/json data!
      _currentVideos = await runBusyFuture(_videoFeedService.getAllVideos());
      if (hasVideos) {
        _isInitialized = true;
      }

      await runBusyFuture(loadVideo(currentScreen));
      await runBusyFuture(play(currentScreen));
      _isVideoReady = true;
    }
  }

  void setCurrentScreen(index) {
    _currentScreen = index;
    notifyListeners();
  }

  set setIsFirstTime(bool value) {
    _isFirstTime = value;
    _preferencesService.saveIsFirstTimeAppLaunched(_isFirstTime);
  }

  set setAdress(String address) => _address = address;

  VideoPlayable getVideoPlayableFor(int index) {
    return _currentVideos[index];
  }

  void pause(int index) {
    _currentVideos[index].controller?.pause();
  }

  void pauseAll() {
    for (var video in _currentVideos) {
      video.controller?.pause();
    }
  }

  Future<void> play(int index) async {
    _currentScreen = index;

    await _currentVideos[index].controller?.play();
  }

  Future<void> loadVideo(int index) async {
    //CALL TO SERVICE later...
    _currentScreen = index;
    if (_currentVideos.isEmpty) {
      _currentVideos = await _videoFeedService.getAllVideos();
    }
    if (_currentVideos.length > index && _currentVideos[index].controller == null) {
      await _currentVideos[index].loadController();
    }
    //Don't await the caching, this will produce stuttering
    _handleCaching(index);
  }

  Future<void> _handleCaching(int index) async {
    await _cacheVideos(index);
    await _uncacheVideos(index);
  }

  Future<void> _cacheVideos(int index) async {
    if (kDebugMode) print("_cacheVideos()");
    final int listLength = _currentVideos.length;

    for (int i = 1; i <= Constants.maxCachedVideos; i++) {
      //cache videos greater than current index
      final int indexUpper = index + i;
      if ((indexUpper < listLength) && _currentVideos[indexUpper].controller == null) {
        await _currentVideos[indexUpper].loadController();
      }
      //cache videos less than current index
      final int indexLower = index - i;
      if (indexLower >= 0 && _currentVideos[indexLower].controller == null) {
        await _currentVideos[indexLower].loadController();
      }
    }
  }

  Future<void> _uncacheVideos(int index) async {
    if (kDebugMode) print("_uncacheVideos()");
    final int listLength = _currentVideos.length;
    //only uncache the 'outest' 2 videos of the feed
    //uncache video greater than current index
    final int indexUpper = index + Constants.maxCachedVideos + 1;
    if (indexUpper < listLength && _currentVideos[indexUpper].controller != null) {
      await _currentVideos[indexUpper].controller?.dispose();
      _currentVideos[indexUpper].controller = null;
    }
    //uncache video less than current index
    final int indexLower = index - Constants.maxCachedVideos;
    if (indexLower >= 0 && _currentVideos[indexLower].controller != null) {
      await _currentVideos[indexLower].controller?.dispose();
      _currentVideos[indexLower].controller = null;
    }
  }

  void _freeAllVideos() {
    for (VideoPlayable videoPlayable in _currentVideos) {
      if (videoPlayable.controller != null) {
        videoPlayable.controller!.dispose();
        videoPlayable.controller = null;
      }
    }
  }

  Future<void> retry() async {
    //Call to Service later
    _retries++;
    if (_retries > Constants.maxLoadVideosRetries) {
      _retries = 0;
      _freeAllVideos();
      setError(CannotRecoverUIException());
      return;
    }

    if (_currentVideos.isEmpty) {
      _currentVideos = await runBusyFuture(_videoFeedService.getAllVideos());
      await runBusyFuture(loadVideo(currentScreen));
    }

    if (_currentVideos.isNotEmpty) {
      clearErrors();
      notifyListeners();
      _retries = 0;
    }
  }
}
