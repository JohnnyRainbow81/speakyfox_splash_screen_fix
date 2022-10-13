abstract class ClassRepository<T> {
  Future<List<T>> getAllByLanguagePairId(String languagePairId);
}