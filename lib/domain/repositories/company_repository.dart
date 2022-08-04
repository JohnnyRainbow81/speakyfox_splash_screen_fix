abstract class CompanyRepository<T> {
  Future<List<T>> getAll();
  Future<T?> get(String id);
}
