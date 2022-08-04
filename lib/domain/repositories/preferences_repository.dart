abstract class PreferencesRepository<T> {
  Future<bool> init(T preferences);
  Future<bool> save(T preferences);
  Future<T> load();
}
