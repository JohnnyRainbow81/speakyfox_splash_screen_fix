// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/data/repositories_impls/language_repository_impl.dart';
import 'package:speakyfox/domain/models/language.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/language_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class LanguageService extends BaseService<Language> {
  late final LanguageRepository<Language> _languageRepository;

  LanguageService(LanguageRepositoryImpl repositoryImpl) : super(repositoryImpl) {
    _languageRepository = repositoryImpl;
  }

  Future<Language> getLanguageById(String id) {
    return _languageRepository.getLanguageById(id);
  }

  Future<List<Language>> getTargetLanguages() {
    return _languageRepository.getTargetLanguages();
  }

  Future<List<Language>> getTargetLanguagesBySourceLanguageId(String languageId) {
    return _languageRepository.getTargetLanguagesBySourceLanguageId(languageId);
  }

  Future<List<Language>> getSourceLanguages() {
    return _languageRepository.getSourceLanguages();
  }

  Future<List<Language>> getSourceLanguagesByTargetLanguageId(String languageId) {
    return _languageRepository.getSourceLanguagesByTargetLanguageId(languageId);
  }
}
