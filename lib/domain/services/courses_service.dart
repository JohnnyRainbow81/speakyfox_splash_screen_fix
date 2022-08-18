import 'package:speakyfox/domain/models/course.dart';
import 'package:speakyfox/domain/repositories/course_repository.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseService {
  final CourseRepository _courseRepository;

  CourseService(this._courseRepository);

  Future<Course> getByIdDetailed(String id, bool detailed) async {
    return await _courseRepository.getByIdDetailed(id, detailed);
  }
}
