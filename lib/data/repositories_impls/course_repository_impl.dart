import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/course_mapper.dart';
import 'package:speakyfox/data/remote/course_client.dart';
import 'package:speakyfox/domain/models/course.dart';
import 'package:speakyfox/domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseClient _courseClient;
  final ConnectivityService _connectivityService;

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
}
