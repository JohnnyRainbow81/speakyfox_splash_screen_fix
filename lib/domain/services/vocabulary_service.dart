import 'dart:math';

import 'package:speakyfox/domain/models/vocabulary.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/vocabulary_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class VocabularyService extends BaseService<Vocabulary> {
  final VocabularyRepository _vocabularyRepository;

  VocabularyService(BaseRepository<Vocabulary> baseRepository, this._vocabularyRepository) : super(baseRepository);

}
