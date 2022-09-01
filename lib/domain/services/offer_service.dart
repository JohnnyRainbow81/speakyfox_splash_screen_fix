import 'package:speakyfox/domain/models/offer.dart';
import 'package:speakyfox/domain/repositories/offer_repository.dart';

class OfferService {
  final OfferRepository<Offer> _offerRepository;

  OfferService(this._offerRepository);

  Future<Offer> getOfferByRefOrNull(String ref) async {
    return _offerRepository.getOfferByRefOrNull(ref);
  }
}
