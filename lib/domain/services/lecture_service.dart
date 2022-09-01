import 'package:speakyfox/domain/models/lecture.dart';
import 'package:speakyfox/domain/models/sequence.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/lecture_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';


class LectureService extends BaseService<Lecture> {
  final LectureRepository<Lecture, Sequence> _lectureRepository;
  late Lecture lecture;

  LectureService(BaseRepository<Lecture> baseRepository, this._lectureRepository) : super(baseRepository);

  Future<List<Lecture>> getAllLecturesByCourseId(String courseId) {
    return _lectureRepository.getAllLecturesByCourseId(courseId);
  }

  Future<List<Lecture>> getAllV2([String queryParameters = ""]) {
    return _lectureRepository.getAllV2();
  }

  Future<Lecture> getByIdDetailed(String id, [bool detailed = false]) {
    return _lectureRepository.getByIdDetailed(id, false);
  }

  Future<Lecture> getByIdDetailedV2(String id, [bool detailed = false]) {
    return _lectureRepository.getByIdDetailedV2(id, false);
  }

  Future<List<Lecture>> getOnboardingLecturesByLanguageIds(String sourceLanguageId, String targetLanguageId) {
    return _lectureRepository.getOnboardingLecturesByLanguageIds(sourceLanguageId, targetLanguageId);
  }

  Future patchSequences(String lectureId, List<Sequence> sequences) {
    return _lectureRepository.patchSequences(lectureId, sequences);
  }

  Future updateProgress(String lectureId, double progress) {
    return _lectureRepository.updateProgress(lectureId, progress);
  }
}
