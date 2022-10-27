
abstract class CourseRepository<T>{
  Future<T> getByIdDetailed(String id, bool detailed);
}
