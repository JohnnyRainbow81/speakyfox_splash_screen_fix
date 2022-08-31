import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/order_dto.dart';
import 'package:speakyfox/data/dtos/payment_method_dto.dart';
import 'package:speakyfox/data/dtos/plan_dto.dart';
import 'package:speakyfox/data/dtos/product_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/dtos/subscription_dto.dart';
import 'package:speakyfox/data/remote/base_client.dart';
import 'package:speakyfox/domain/models/product.dart';
part 'product_client.g.dart';

@RestApi()
abstract class ProductClient with BaseClient<ProductDto> {
  factory ProductClient(Dio dio, {String baseUrl}) = _ProductClient;

  @GET("/subscriptions/{id}")
  Future<Response<SubscriptionDto>> getSubscriptionById(@Path("id") String id);
}
