import 'package:speakyfox/domain/models/payment_method.dart';
import 'package:speakyfox/domain/models/plan.dart';
import 'package:speakyfox/domain/repositories/plan_repository.dart';

class PlanService {
  final PlanRepository<PaymentMethod> _planRepository;

  PlanService(this._planRepository);

  Future<List<PaymentMethod>> getPaymentMethodsByPlanId(String planId) {
    return _planRepository.getPaymentMethodsByPlanId(planId);
  }
}
