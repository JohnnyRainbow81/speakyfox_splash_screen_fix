import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/offer_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
    part 'offer_client.g.dart';

@RestApi()
abstract class OfferClient {
  factory OfferClient(Dio dio, {String baseUrl}) = _OfferClient;

  @GET("")
  Future<Response<OfferDto>> getOfferByRefOrNull(@Query("ref") ref);

}
