import 'package:speakyfox/data/repositories_impls/class_repository_impl.dart';
import 'package:speakyfox/domain/models/class.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class ClassService extends BaseService<Class> {
  ClassService(ClassRepositoryImpl classRepositoryImpl) : super(classRepositoryImpl);
}