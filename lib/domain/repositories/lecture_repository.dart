import 'package:speakyfox/domain/repositories/base_repository.dart';

abstract class LectureRepository<T, S> {
  Future<T> getByIdDetailed(String id, [bool detailed = false]);
  Future<List<T>> getAllV2(String sourceLanguageId, String targetLanguageId, [bool isOnboarding = false]);
  Future<T> getByIdDetailedV2(String id, [bool detailed = false]);
  Future<List<T>> getOnboardingLecturesByLanguageIds(String sourceLanguageId, String targetLanguageId);
  Future<List<T>> getAllLecturesByCourseId(String courseId);
  Future<dynamic> updateProgress(String lectureId, double progress);
  Future<dynamic> patchSequences(String lectureId, List<S> sequences);
}
