import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/course_mapper.dart';
import 'package:speakyfox/data/remote/course_client.dart';
import 'package:speakyfox/domain/models/course.dart';
import 'package:speakyfox/domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final ConnectivityService _connectivityService;
  final CourseClient _courseClient;

  CourseRepositoryImpl(this._courseClient, this._connectivityService);

  @override
  Future<Course> getByIdDetailed(String id, bool detailed) async {
    //Try to load from local source
    try {
      throw Error(); //TODO Caching
    } catch (cacheError) {
      //Not stored locally? get from backend
      if (await _connectivityService.hasConnection()) {
        try {
          final response = await _courseClient.getByIdDetailed(id, detailed);
          return response.data.toCourse();
        } catch (error) {
          ErrorHandler.handleError(error);
        }
      } else {
        throw NoInternetConnectionUIException();
      }
    }
    throw LoginNotSuccessfulException();
  }

  @override
  Future<List<Course>> getAll(String param) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Course> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Course> patchById(String id, entity) {
    // TODO: implement patchById
    throw UnimplementedError();
  }

  @override
  Future<Course> post(entity) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<bool> removeById(String id) {
    // TODO: implement removeById
    throw UnimplementedError();
  }
}
