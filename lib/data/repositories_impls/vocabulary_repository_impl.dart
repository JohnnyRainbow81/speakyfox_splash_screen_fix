import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/data/remote/vocabulary_client.dart';
import 'package:speakyfox/domain/models/vocabulary.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/vocabulary_repository.dart';

class VocabularyRepositoryImpl implements VocabularyRepository<Vocabulary>, BaseRepository<Vocabulary> {
  final VocabularyClient _vocabularyClient;
  final ConnectivityService _connectivityService;

  VocabularyRepositoryImpl(this._connectivityService, this._vocabularyClient);

  @override
  Future<List<Vocabulary>> getAll(String param) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Vocabulary> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Vocabulary> patchById(String id, Vocabulary entity) {
    // TODO: implement patchById
    throw UnimplementedError();
  }

  @override
  Future<Vocabulary> post(Vocabulary entity) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<bool> removeById(String id) {
    // TODO: implement removeById
    throw UnimplementedError();
  }
}
