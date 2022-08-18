import 'package:speakyfox/domain/models/course.dart';

abstract class CourseRepository {
  Future<Course> getByIdDetailed(String id, bool detailed);
}
