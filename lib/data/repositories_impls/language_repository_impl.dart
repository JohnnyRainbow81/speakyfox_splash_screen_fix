// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/language_mapper.dart';
import 'package:speakyfox/data/remote/language_client.dart';
import 'package:speakyfox/domain/models/language.dart';
import 'package:speakyfox/domain/repositories/language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository<Language> {
  final ConnectivityService _connectivityService;
  final LanguageClient _languageClient;

  LanguageRepositoryImpl(
    this._connectivityService,
    this._languageClient,
  );

  @override
  Future<List<Language>> getAll(String param) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _languageClient.getAll("");
        return response.data.map((languageDto) => languageDto.toLanguage()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LanguageRepositoryImpl.getAll");
  }

  @override
  Future<Language> getById(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _languageClient.getById(id);
        return response.data.toLanguage();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LanguageRepositoryImpl.getById");
  }

  @override //FIXME doppelt, s.o.
  Future<Language> getLanguageById(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _languageClient.getById(id);
        return response.data.toLanguage();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LanguageRepositoryImpl.getLanguageById()");
  }

  @override
  Future<List<Language>> getSourceLanguages([bool isSourceLanguage = true]) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _languageClient.getSourceLanguages();
        return response.data.map((languageDto) => languageDto.toLanguage()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LanguageRepositoryImpl.getSourceLanguages()");
  }

  @override
  Future<List<Language>> getSourceLanguagesByTargetLanguageId(String languageId) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _languageClient.getSourceLanguages();
        return response.data.map((languageDto) => languageDto.toLanguage()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LanguageRepositoryImpl.getSourceLanguagesByTargetLanguageId()");
  }

  @override
  Future<List<Language>> getTargetLanguages({bool isTargetLanguage = true}) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _languageClient.getSourceLanguages();
        return response.data.map((languageDto) => languageDto.toLanguage()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LanguageRepositoryImpl.getTargetLanguages()");
  }

  @override
  Future<List<Language>> getTargetLanguagesBySourceLanguageId(String languageId, {bool isTargetLanguage = true}) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _languageClient.getSourceLanguages();
        return response.data.map((languageDto) => languageDto.toLanguage()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LanguageRepositoryImpl.getTargetLanguagesBySourceLanguageId()");
  }

  @override
  Future<Language> patchById(String id, Language entity) {
    // TODO: implement patchById
    throw UnimplementedError();
  }

  @override
  Future<Language> post(Language entity) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<bool> removeById(String id) {
    // TODO: implement removeById
    throw UnimplementedError();
  }
}
