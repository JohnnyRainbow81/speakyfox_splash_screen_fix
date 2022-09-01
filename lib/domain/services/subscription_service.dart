import 'package:speakyfox/data/requests/subscription_create.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/subscription_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class SubscriptionService extends BaseService<Subscription> {
  final SubscriptionRepository _subscriptionRepository;

  SubscriptionService(BaseRepository<Subscription> baseRepository, this._subscriptionRepository)
      : super(baseRepository);

  Future createSubscription(String userId, SubscriptionCreateRequest subscription) {
    return _subscriptionRepository.createSubscription(userId, subscription);
  }

  Future<bool> cancel(String id) {
    return _subscriptionRepository.cancel(id);
  }

}
