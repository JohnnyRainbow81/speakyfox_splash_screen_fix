import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/payment_method_mapper.dart';
import 'package:speakyfox/data/remote/plan_client.dart';
import 'package:speakyfox/domain/models/payment_method.dart';
import 'package:speakyfox/domain/models/plan.dart';
import 'package:speakyfox/domain/repositories/plan_repository.dart';

class PlanRepositoryImpl implements PlanRepository<PaymentMethod> {
  final ConnectivityService _connectivityService;
  final PlanClient _planClient;

  PlanRepositoryImpl(this._connectivityService, this._planClient);

  @override
  Future<List<PaymentMethod>> getPaymentMethodsByPlanId(String planId) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _planClient.getPaymentMethodsByPlanId(planId);
        return response.data.map((e) => e.toPaymentMethod()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "PlanRepositoryImpl.getPaymentMethodsByPlanId()");
  }

  @override
  Future<List<PaymentMethod>> getAll(String param) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<PaymentMethod> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<PaymentMethod> patchById(String id, PaymentMethod entity) {
    // TODO: implement patchById
    throw UnimplementedError();
  }

  @override
  Future<PaymentMethod> post(PaymentMethod entity) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<bool> removeById(String id) {
    // TODO: implement removeById
    throw UnimplementedError();
  }
}
