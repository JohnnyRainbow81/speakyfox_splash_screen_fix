import 'dart:math';

import 'package:speakyfox/domain/repositories/vocabulary_repository.dart';

class VocabularyService implements VocabularyRepository {  
  final VocabularyRepository _vocabularyRepository;

  VocabularyService(this._vocabularyRepository);

  @override
  Future<List> getAll(String param) async {
    return _vocabularyRepository.getAll(param);
  }

  @override
  Future getById(String id) {
    return _vocabularyRepository.getById(id);
  }

  @override
  Future patchById(String id, entity) {
    return _vocabularyRepository.patchById(id, entity);
  }

  @override
  Future post(entity) {
    return _vocabularyRepository.post(entity);
  }

  @override
  Future<bool> removeById(String id) {
    return _vocabularyRepository.removeById(id);
  }
}
