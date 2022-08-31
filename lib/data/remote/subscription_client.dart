import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/dtos/subscription_dto.dart';
import 'package:speakyfox/data/remote/base_client.dart';
import 'package:speakyfox/domain/models/subscription.dart';
part 'subscription_client.g.dart';

@RestApi()
abstract class SubscriptionClient with BaseClient<SubscriptionDto> {
  factory SubscriptionClient(Dio dio, {String baseUrl}) = _SubscriptionClient;

  @POST("users/{id}/subscriptions")
  Future<Response<SubscriptionDto>> createSubscription(@Path("id") String id, @Body() Map<String, dynamic> subscription);
}
