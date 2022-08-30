import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/order_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
    part 'order_client.g.dart';

@RestApi()
abstract class OrderClient {
  factory OrderClient(Dio dio, {String baseUrl}) = _OrderClient;

  @GET("users/{userid}/orders")
  Future<Response<OrderDto>> createOrder(@Path() String userId, @Body() Map<String, dynamic> order);

}
