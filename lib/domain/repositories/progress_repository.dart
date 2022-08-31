abstract class ProgressRepository<T> {
  Future<bool> updateProgress(String lectureId, double progress);
}
