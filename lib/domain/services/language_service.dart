// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/data/repositories_impls/language_repository_impl.dart';
import 'package:speakyfox/domain/models/language.dart';
import 'package:speakyfox/domain/repositories/language_repository.dart';

class LanguageService {
  final LanguageRepository<Language> _languageRepository;

  LanguageService(
    this._languageRepository,
  );

  Future<List<Language>> getAll() {
    return _languageRepository.getAll("");
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
