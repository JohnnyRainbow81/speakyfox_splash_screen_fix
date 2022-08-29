// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/language_pair_mapper.dart';
import 'package:speakyfox/data/remote/language_pair_client.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/repositories/language_pairs_repository.dart';

class LanguagePairRepositoryImpl implements LanguagePairRepository<LanguagePair> {
  final ConnectivityService _connectivityService;
  final LanguagePairClient _languagePairsClient;

  LanguagePairRepositoryImpl(
    this._connectivityService,
    this._languagePairsClient,
  );

  @override
  Future<List<LanguagePair>> getAll(String param) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _languagePairsClient.getAll("");
        return response.data.map((languagePairDto) => languagePairDto.toLanguagePair()).toList();

      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LanguagePairRepositoryImpl.getById");
  }

  @override
  Future<LanguagePair> getById(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _languagePairsClient.getById(id);
        return response.data.toLanguagePair();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "LanguagePairRepositoryImpl.getById");
  }

  @override
  Future<LanguagePair> patchById(String id, LanguagePair entity) {
    // TODO: implement patchById
    throw UnimplementedError();
  }

  @override
  Future<LanguagePair> post(LanguagePair entity) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<bool> removeById(String id) {
    // TODO: implement removeById
    throw UnimplementedError();
  }
}
