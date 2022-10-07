import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/offer_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/remote/base_client.dart';
    part 'offer_client.g.dart';

@RestApi()
abstract class OfferClient with BaseClient<OfferDto>{
  factory OfferClient(Dio dio, {String baseUrl}) = _OfferClient;

  @GET("")
  Future<Response<OfferDto>> getOfferByRefOrNull(@Query("ref") ref);

}
