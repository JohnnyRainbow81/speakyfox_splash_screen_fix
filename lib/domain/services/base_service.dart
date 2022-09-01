import 'package:speakyfox/domain/repositories/base_repository.dart';

//For general CRUD methods
class BaseService<T> {
  final BaseRepository<T> _baseRepository;

  BaseService(this._baseRepository);

  Future<List<T>> getAll(String param) async {
    return _baseRepository.getAll(param);
  }

  Future<T> getById(String id) async {
    return _baseRepository.getById(id);
  }

  Future<T> patchById(String id, entity) async {
    return _baseRepository.patchById(id, entity);
  }

  Future<T> post(entity) async {
    return _baseRepository.post(entity);
  }

  Future<bool> removeById(String id) async {
    return _baseRepository.removeById(id);
  }
}
