abstract class PlanRepository<T> {
  Future<List<T>> getPaymentMethodsByPlanId(String planId);
}
