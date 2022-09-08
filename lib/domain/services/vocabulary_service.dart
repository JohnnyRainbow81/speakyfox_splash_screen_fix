import 'dart:math';

import 'package:speakyfox/data/repositories_impls/vocabulary_repository_impl.dart';
import 'package:speakyfox/domain/models/vocabulary.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/vocabulary_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class VocabularyService extends BaseService<Vocabulary> {
  late final VocabularyRepository _vocabularyRepository;

  VocabularyService(VocabularyRepositoryImpl vocabularyRepositoryImpl) : super(vocabularyRepositoryImpl) {
    _vocabularyRepository = vocabularyRepositoryImpl;
  }
}
