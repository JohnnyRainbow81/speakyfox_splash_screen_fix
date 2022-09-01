import 'package:speakyfox/data/requests/subscription_create.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';

abstract class SubscriptionRepository<T>  {
  Future<T> createSubscription(String userId, SubscriptionCreateRequest subscription);
  Future<bool> cancel(String id);
}
