// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:speakyfox/domain/models/video.dart';
import 'package:speakyfox/domain/repositories/video_repository.dart';
import 'package:speakyfox/domain/services/preferences_service.dart';
import 'package:speakyfox/presentation/screens/videofeed/video_playable.dart';

class VideoFeedService {
  final PreferencesService _preferencesService;
  final VideoRepository<Video> _videoRepository;

  VideoFeedService(
    this._preferencesService,
    this._videoRepository,
  );

  Future<List<VideoPlayable>> getAllVideos() async {
    List<Video> videos = await _videoRepository.getAll();
    List<VideoPlayable> videoPlayables = [];
    for (Video? video in videos) {
      VideoPlayable videoPlayable = VideoPlayable(video!);
      videoPlayables.add(videoPlayable);
    }
    return videoPlayables;
  }
}
