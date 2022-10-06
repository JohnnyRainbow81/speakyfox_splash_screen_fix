import 'package:flutter_phoenix/generated/i18n.dart';
import 'package:speakyfox/data/repositories_impls/subscription_repository_impl.dart';
import 'package:speakyfox/data/requests/subscription_create.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/subscription_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class SubscriptionService extends BaseService<Subscription> {
  late final SubscriptionRepository _subscriptionRepository;

  SubscriptionService(SubscriptionRepositoryImpl subscriptionRepositoryImpl) : super(subscriptionRepositoryImpl) {
    _subscriptionRepository = subscriptionRepositoryImpl;
  }

 

  Future<bool> cancel(String id) {
    return _subscriptionRepository.cancel(id);
  }
}
