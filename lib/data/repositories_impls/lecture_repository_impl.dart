import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/lecture_mapper.dart';
import 'package:speakyfox/data/mappers/sequence_mapper.dart';
import 'package:speakyfox/data/remote/lecture_client.dart';
import 'package:speakyfox/domain/models/lecture.dart';
import 'package:speakyfox/domain/models/sequence.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/lecture_repository.dart';

class LectureRepositoryImpl implements LectureRepository<Lecture, Sequence>, BaseRepository<Lecture> {
  final ConnectivityService _connectivityService;
  final LectureClient _lectureClient;

  LectureRepositoryImpl(this._connectivityService, this._lectureClient);

  @override
  Future<List<Lecture>> getAll(String param) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _lectureClient.getAll("");
        return response.data.map((lectureDto) => lectureDto.toLecture()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.getAll");
  }

  @override
  Future<List<Lecture>> getAllLecturesByCourseId(String courseId) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _lectureClient.getAllLecturesByCourseId(courseId);
        return response.data.map((lectureDto) => lectureDto.toLecture()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.getAllLecturesByCourseId()");
  }

  @override
  Future<List<Lecture>> getAllV2([String queryParameters = ""]) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _lectureClient.getAllV2(queryParameters);
        return response.data.map((lectureDto) => lectureDto.toLecture()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.getAllV2()");
  }

  @override
  Future<Lecture> getById(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _lectureClient.getById(id);
        return response.data.toLecture();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.getById()");
  }

  @override
  Future<Lecture> getByIdDetailed(String id, [bool detailed = false]) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _lectureClient.getByIdDetailed(id, detailed);
        return response.data.toLecture();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.getByIdDetailed()");
  }

  @override
  Future<Lecture> getByIdDetailedV2(String id, [bool detailed = false]) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _lectureClient.getByIdDetailedV2(id, detailed);
        return response.data.toLecture();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.getByIdDetailedV2()");
  }

  @override
  Future<List<Lecture>> getOnboardingLecturesByLanguageIds(String sourceLanguageId, String targetLanguageId) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _lectureClient.getOnboardingLecturesByLanguageIds(sourceLanguageId, targetLanguageId);
        return response.data.map((lectureDto) => lectureDto.toLecture()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.getOnboardingLecturesByLanguageIds()");
  }

  @override
  Future<Lecture> patchById(String id, Lecture entity) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _lectureClient.patchById(id, entity);
        return response.data.toLecture();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.patchById()");
  }

  @override
  Future patchSequences(String lectureId, List<Sequence> sequences) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response =
            await _lectureClient.patchSequences(lectureId, sequences.map((e) => e.toSequenceDto()).toList());
        return response.data.map((lectureDto) => lectureDto.toLecture()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.patchSequences()");
  }

  @override
  Future<Lecture> post(Lecture entity) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _lectureClient.post(entity);
        return response.data.toLecture();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.post()");
  }

  @override
  Future<bool> removeById(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _lectureClient.removeById(id);
        bool success = response.data;
        return success;
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.removeById()");
  }

  @override
  Future updateProgress(String lectureId, double progress) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _lectureClient.updateProgress(lectureId, {"progress" : progress});
        //FIXME get rid of dynamic
        return response.data;
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LectureRepositoryImpl.updateProgress()");
  }
}
