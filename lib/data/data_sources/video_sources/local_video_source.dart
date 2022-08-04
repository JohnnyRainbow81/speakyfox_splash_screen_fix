import '../../../domain/repositories/video_repository.dart';

import '../../dto/video_dto.dart';

class LocalVideoSource implements VideoRepository<VideoDTO> {
  List<VideoDTO> _cachedVideos = [];
  //Cache oder saving in HD?
  @override
  Future<VideoDTO?> get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<VideoDTO>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  void saveVideosToCache(List<VideoDTO> videos) {
    _cachedVideos = videos;
  }

  void clearCache() {
    _cachedVideos.clear();
  }
}
