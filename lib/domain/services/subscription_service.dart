import 'package:speakyfox/data/requests/subscription_create.dart';
import 'package:speakyfox/domain/repositories/subscription_repository.dart';

class SubscriptionService implements SubscriptionRepository {
  final SubscriptionRepository _subscriptionRepository;

  SubscriptionService(this._subscriptionRepository);

  @override
  Future createSubscription(String userId, SubscriptionCreateRequest subscription) {
    return _subscriptionRepository.createSubscription(userId, subscription);
  }

  @override
  Future<List> getAll(String param) {
    return _subscriptionRepository.getAll(param);
  }

  @override
  Future getById(String id) {
    return _subscriptionRepository.getById(id);
  }

  @override
  Future patchById(String id, entity) {
    return _subscriptionRepository.patchById(id, entity);
  }

  @override
  Future post(entity) {
    return _subscriptionRepository.post(entity);
  }

  @override
  Future<bool> removeById(String id) {
    return _subscriptionRepository.removeById(id);
  }
}
