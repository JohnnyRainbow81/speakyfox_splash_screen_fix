import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/language_pair_dto.dart';
import 'package:speakyfox/data/dtos/order_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/dtos/subscription_dto.dart';
import 'package:speakyfox/data/dtos/user_dto.dart';
import 'package:speakyfox/data/remote/base_client.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
part 'user_client.g.dart';

@RestApi()
abstract class UserClient with BaseClient<UserDto> {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @POST("{id}")
  Future<Response<UserDto>> createUser(@Body() Map<String, dynamic> createUserRequest);

  @POST("users/{userId}/payment-methods")
  Future<String> attachPaymentMethodToUser(@Path("userId") String userId, @Body() List<String> body);

  @GET("orders")
  Future<Response<OrderDto>> getOrdersOfCurrentUser();

  @GET("subscriptions")
  Future<Response<SubscriptionDto>> getSubscriptions();

  @PATCH("users/me/password")
  Future<Response<bool>> changePassword(@Body() Map<String, dynamic> changePasswordRequest);

  @PATCH("users/{userId}/language-pair")
  Future<Response<LanguagePairDto>> patchLanguagePairBySourceTargetLanguagesIds(
      @Path("userId") String userId, @Body() List<String> body);

  @POST("users/{userId}/payment-methods/setup-intents")
  Future<Response<String>> createSetupIntent(@Path("userId") String userId, @Body() String paymentMethodType);

  @DELETE("payment-methods")
  Future<Response<bool>> removePaymentMethod(
      @Query("paymentMethodType") String paymentMethodType, @Query("externalId") String externalId);
}
