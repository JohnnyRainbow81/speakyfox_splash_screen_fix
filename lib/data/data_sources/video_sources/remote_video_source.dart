// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_starterkit/data/apis/video_remote_client.dart';

import '../../../domain/repositories/video_repository.dart';
import '../../dto/video_dto.dart';

//Call remote API here...
class RemoteVideoSource implements VideoRepository<VideoDTO> {
  //VideoRemoteClient _videoRemoteClient;

  RemoteVideoSource(
     //this._videoRemoteClient,
  );
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
}
