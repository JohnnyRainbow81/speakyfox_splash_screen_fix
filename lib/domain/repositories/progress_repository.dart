abstract class ProgressRepository {
  Future<bool> updateProgress(String lectureId, double progress);
}
