import 'package:speakyfox/data/repositories_impls/course_repository_impl.dart';
import 'package:speakyfox/domain/models/course.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/course_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseService extends BaseService<Course> {
  late final CourseRepository _courseRepository;

  CourseService(CourseRepositoryImpl courseRepositoryImpl) : super(courseRepositoryImpl) {
    _courseRepository = courseRepositoryImpl;
  }

  Future<Course> getByIdDetailed(String id, bool detailed) async {
    return await _courseRepository.getByIdDetailed(id, detailed);
  }
}
