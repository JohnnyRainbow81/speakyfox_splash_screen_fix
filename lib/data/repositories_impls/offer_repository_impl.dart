import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/offer_mapper.dart';
import 'package:speakyfox/data/remote/offer_client.dart';
import 'package:speakyfox/domain/models/offer.dart';
import 'package:speakyfox/domain/repositories/offer_repository.dart';

class OfferRepositoryImpl implements OfferRepository<Offer> {
  ConnectivityService _connectivityService;
  OfferClient _offerClient;

  OfferRepositoryImpl(this._connectivityService, this._offerClient);

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

    throw UIException(message: "LectureRepositoryImpl.patchById()");
  }
}
