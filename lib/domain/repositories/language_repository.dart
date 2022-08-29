import 'package:speakyfox/domain/repositories/base_repository.dart';

abstract class LanguageRepository<T> extends BaseRepository<T> {
  //https://speakyfox-api-production.herokuapp.com/api/v1/languages/067ab4d6-fb38-4f82-bda6-2daa217e9ed2
  Future<List<T>> getTargetLanguages({bool isTargetLanguage = true});
  Future<List<T>> getTargetLanguagesBySourceLanguageId(String languageId, {bool isTargetLanguage = true});

  Future<List<T>> getSourceLanguages([bool isSourceLanguage = true]);
  Future<List<T>> getSourceLanguagesByTargetLanguageId(String languageId);

  Future<T> getLanguageById(String id);
}
