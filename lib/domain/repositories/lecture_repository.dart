import 'package:speakyfox/domain/models/sequence.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';

abstract class LectureRepository<T, S> extends BaseRepository<T> {
  T getByIdDetailed(String id, [bool detailed = false]);
  List<T> getAllV2([String queryParameters = ""]);
  T getByIdDetailedV2(String id, [bool detailed = false]);
  List<T> getOnboardingLecturesByLanguageIds(String sourceLanguageId, String targetLanguageId);
  List<T> getAllLecturesByCourseId(String courseId);
  dynamic updateProgress(String lectureId, double progress);
  dynamic patchSequeunces(String lectureId, List<S> sequences);
}
