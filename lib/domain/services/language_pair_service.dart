import 'package:speakyfox/domain/models/language.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/repositories/language_pairs_repository.dart';
import 'package:speakyfox/domain/repositories/language_repository.dart';

class LanguagePairService  {
  final LanguagePairRepository<LanguagePair> _languagePairRepository;

  LanguagePairService(this._languagePairRepository);

  Future<List<LanguagePair>> getAll(String param) async {
    return _languagePairRepository.getAll(param);
  }

  Future<LanguagePair> getById(String id) {
       return _languagePairRepository.getById(id);
  }


}
