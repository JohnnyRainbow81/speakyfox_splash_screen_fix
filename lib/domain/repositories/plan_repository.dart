import 'package:speakyfox/domain/models/payment_method.dart';

abstract class PlanRepository<T> {
  Future<List<PaymentMethod>> getPaymentMethodsByPlanId(String planId);
}
