import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';

abstract class ProductRepository<T, S> {
  Future<S> getSubscriptionById(String id);
}
