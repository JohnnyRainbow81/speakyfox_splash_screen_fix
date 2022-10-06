
abstract class SubscriptionRepository<T>  {
  Future<bool> cancel(String id);
}
