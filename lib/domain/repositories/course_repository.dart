import 'package:speakyfox/domain/models/course.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';

abstract class CourseRepository<T>{
  Future<T> getByIdDetailed(String id, bool detailed);
}
