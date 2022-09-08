abstract class ProductRepository<T, S> {
  Future<S> getSubscriptionById(String id);
}
