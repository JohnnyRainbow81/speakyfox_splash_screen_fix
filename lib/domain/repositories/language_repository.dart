abstract class LanguageRepository<L> {
  //https://speakyfox-api-production.herokuapp.com/api/v1/languages/067ab4d6-fb38-4f82-bda6-2daa217e9ed2
  Future<L> getTargetLanguages();
  Future<L> getTargetLanguagesBySourceLanguageId(String languageId);

  Future<List<L>> getSourceLanguages();
  Future<L> getSourceLanguagesByTargetLanguageId(String languageId);

  Future<L> getLanguageById(String id);
}
