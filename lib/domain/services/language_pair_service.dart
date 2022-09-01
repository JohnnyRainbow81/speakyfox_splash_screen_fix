import 'package:speakyfox/domain/models/language.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/language_pairs_repository.dart';
import 'package:speakyfox/domain/repositories/language_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class LanguagePairService extends BaseService<LanguagePair> {
  final LanguagePairRepository<LanguagePair> _languagePairRepository;

  LanguagePairService(BaseRepository<LanguagePair> baseRepository, this._languagePairRepository)
      : super(baseRepository);
}
