import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/dtos/subscription_dto.dart';
import 'package:speakyfox/data/remote/base_client.dart';

part 'subscription_client.g.dart';

@RestApi()
abstract class SubscriptionClient with BaseClient<SubscriptionDto> {
  factory SubscriptionClient(Dio dio, {String baseUrl}) = _SubscriptionClient;

  //TODO check backend
  //public async Task<IActionResult> UpdateSubscription([FromRoute] Guid id, [FromBody] UpdateSubscriptionDTO updateSubscriptionDTO)

  @DELETE("/{id}")
  Future<Response<bool>> cancel(@Path("id") String id);
}
