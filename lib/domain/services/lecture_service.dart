import 'package:speakyfox/domain/models/lecture.dart';
import 'package:speakyfox/domain/models/sequence.dart';
import 'package:speakyfox/domain/repositories/lecture_repository.dart';

//Only a passthrough-Service, see readme.docx
class LectureService implements LectureRepository<Lecture, Sequence> {
  final LectureRepository<Lecture, Sequence> _lectureRepository;
  late Lecture lecture;

  LectureService(this._lectureRepository);

  @override
  Future<List<Lecture>> getAll(String param) {
    return _lectureRepository.getAll(param);
  }

  @override
  Future<List<Lecture>> getAllLecturesByCourseId(String courseId) {
    return _lectureRepository.getAllLecturesByCourseId(courseId);
  }

  @override
  Future<List<Lecture>> getAllV2([String queryParameters = ""]) {
    return _lectureRepository.getAllV2();
  }

  @override
  Future<Lecture> getById(String id) {
    return _lectureRepository.getById(id);
  }

  @override
  Future<Lecture> getByIdDetailed(String id, [bool detailed = false]) {
    return _lectureRepository.getByIdDetailed(id, false);
  }

  @override
  Future<Lecture> getByIdDetailedV2(String id, [bool detailed = false]) {
    return _lectureRepository.getByIdDetailedV2(id, false);
  }

  @override
  Future<List<Lecture>> getOnboardingLecturesByLanguageIds(String sourceLanguageId, String targetLanguageId) {
    return _lectureRepository.getOnboardingLecturesByLanguageIds(sourceLanguageId, targetLanguageId);
  }

  @override
  Future<Lecture> patchById(String id, entity) {
    return _lectureRepository.patchById(id, entity);
  }

  @override
  Future patchSequences(String lectureId, List<Sequence> sequences) {
    return _lectureRepository.patchSequences(lectureId, sequences);
  }

  @override
  Future<Lecture> post(entity) {
    return _lectureRepository.post(entity);
  }

  @override
  Future<bool> removeById(String id) {
    return _lectureRepository.removeById(id);
  }

  @override
  Future updateProgress(String lectureId, double progress) {
    return _lectureRepository.updateProgress(lectureId, progress);
  }
}
