import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/offer_mapper.dart';
import 'package:speakyfox/data/remote/offer_client.dart';
import 'package:speakyfox/domain/models/offer.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/offer_repository.dart';

class OfferRepositoryImpl implements OfferRepository<Offer>, BaseRepository<Offer> {
  ConnectivityService _connectivityService;
  OfferClient _offerClient;

  OfferRepositoryImpl(this._connectivityService, this._offerClient);
  
  @override
  Future<Offer> getById(String id) async {
     if (await _connectivityService.hasConnection()) {
      try {
        final response = await _offerClient.getById(id);
        return response.data.toOffer();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "OfferRepositoryImpl.getById()");
  }

  @override
  Future<Offer> getOfferByRefOrNull(String ref) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _offerClient.getOfferByRefOrNull(ref);
        return response.data.toOffer();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "OfferRepositoryImpl.getOfferByRefOrNull()");
  }

  @override
  Future<List<Offer>> getAll(String param) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _offerClient.getAll("");
        return response.data.map((e) => e.toOffer()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "OfferRepositoryImpl.getAll()");
  }

  @override
  Future<Offer> patchById(String id, Offer entity) {
    // TODO: implement patchById
    throw UnimplementedError();
  }

  @override
  Future<Offer> post(Offer entity) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<bool> removeById(String id) {
    // TODO: implement removeById
    throw UnimplementedError();
  }
}
