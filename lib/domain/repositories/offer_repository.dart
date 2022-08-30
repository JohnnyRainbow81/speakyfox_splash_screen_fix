abstract class OfferRepository<T> {
  Future<T> getOfferByRefOrNull(String ref);
}
