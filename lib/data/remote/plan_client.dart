import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/payment_method_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/remote/base_client.dart';

part 'plan_client.g.dart';

@RestApi()
abstract class PlanClient with BaseClient<PaymentMethodDto> {
  factory PlanClient(Dio dio, {String baseUrl}) = _PlanClient;

  @GET("{planId}/payment-methods")
  Future<Response<List<PaymentMethodDto>>> getPaymentMethodsByPlanId(@Path("planId") String planId);

}
