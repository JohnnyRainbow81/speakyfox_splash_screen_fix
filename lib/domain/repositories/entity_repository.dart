abstract class EntityRepository<T> {
  Future<List<T>> getAll(String param);
  Future<T> getById(String id);
  Future<T> post(T entity);
  Future<T> patchById(String id, T entity);
  Future<bool> removeById(String id);
}
