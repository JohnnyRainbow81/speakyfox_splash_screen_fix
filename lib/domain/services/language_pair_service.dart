import 'package:speakyfox/data/repositories_impls/language_pair_repository_impl.dart';
import 'package:speakyfox/domain/models/language.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/language_pair_repository.dart';
import 'package:speakyfox/domain/repositories/language_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class LanguagePairService extends BaseService<LanguagePair> {
  late final LanguagePairRepository<LanguagePair> _languagePairRepository;

  LanguagePairService(LanguagePairRepositoryImpl languagePairRepositoryImpl) : super(languagePairRepositoryImpl) {
    _languagePairRepository = languagePairRepositoryImpl;
  }
}
