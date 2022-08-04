abstract class VideoRepository<T> {
  Future<List<T>> getAll();
  Future<T?> get(int id);
}
