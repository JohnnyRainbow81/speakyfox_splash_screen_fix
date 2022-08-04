// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter_starterkit/app/connectivity_service.dart';
import 'package:flutter_starterkit/app/error_handling/error_handler.dart';
import 'package:flutter_starterkit/app/error_handling/exceptions_ui.dart';
import 'package:flutter_starterkit/data/mappers/video_mapper.dart';
import 'package:flutter_starterkit/domain/repositories/video_repository.dart';
import '../../domain/models/video.dart';
import '../../main.dart';
import '../data_sources/video_sources/fake_video_source.dart';
import '../data_sources/video_sources/local_video_source.dart';
import '../data_sources/video_sources/remote_video_source.dart';
import '../dto/video_dto.dart';

class VideoRepositoryImpl implements VideoRepository<Video> {
  final RemoteVideoSource _remoteVideoSource;
  final LocalVideoSource _localVideoSource;
  final FakeVideoSource _fakeVideoSource; //TODO kill fakes later
  final ConnectivityService _connectivityService;

  VideoRepositoryImpl(
      this._remoteVideoSource, this._localVideoSource, this._fakeVideoSource, this._connectivityService);

  @override
  Future<Video?> get(int id) async {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<Video>> getAll() async {
    //TODO check hash in Backend
    try {
      //try from local
      List<VideoDTO> responseList = await _localVideoSource.getAll();
      List<Video> videos = [];
      for (final response in responseList) {
        final Video video = response.toDomain();
        videos.add(video);
      }
      return videos;
    } catch (localError) {
      //From remote
      bool hasConnection = await _connectivityService.hasConnection();
      if (hasConnection) {
        //connected to wifi or mobile net
        try {
          List<VideoDTO> responseList = await _remoteVideoSource.getAll();
          List<Video> videos = [];
          for (final response in responseList) {
            final Video video = response.toDomain();
            videos.add(video);
            return videos;
          }
        } catch (e) {
          ErrorHandler.handleError(e);
        }
      } else {
        throw NoInternetConnectionUIException();
      }
    }
    throw NoVideosAvailableUIException();
  }
}
