import 'package:speakyfox/domain/repositories/base_repository.dart';

abstract class PlanRepository<T> extends BaseRepository<T> {
  Future<List<T>> getPaymentMethodsByPlanId(String planId);
}
