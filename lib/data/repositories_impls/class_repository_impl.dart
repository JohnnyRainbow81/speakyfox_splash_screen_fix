import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/class_mapper.dart';
import 'package:speakyfox/data/remote/class_client.dart';
import 'package:speakyfox/domain/models/class.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';

class ClassRepositoryImpl implements BaseRepository<Class> {
  final ConnectivityService _connectivityService;
  final ClassClient _classClient;

  ClassRepositoryImpl(this._classClient, this._connectivityService);

  @override
  Future<List<Class>> getAll(String param) async {
    //Try to load from local source

    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _classClient.getAll(param);
        return response.data.map((e) => e.toClass()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "ClassRepositoryImpl.getAll");
  }

  @override
  Future<Class> getById(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _classClient.getById(id);
        return response.data.toClass();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "ClassRepositoryImpl.getById");
  }

  @override
  Future<Class> patchById(String id, Class entity) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _classClient.patchById(id, entity);
        return response.data.toClass();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "ClassRepositoryImpl.patchById");
  }

  @override
  Future<Class> post(Class entity) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _classClient.post(entity);
        return response.data.toClass();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "ClassRepositoryImpl.patchById");
  }

  @override
  Future<bool> removeById(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _classClient.removeById(id);
        bool success = response.data;
        return success;
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "ClassRepositoryImpl.removeById");
  }
}
