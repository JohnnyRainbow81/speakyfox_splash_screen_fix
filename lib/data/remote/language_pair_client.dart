import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/language_pair_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/remote/base_client.dart';
part 'language_pair_client.g.dart';

@RestApi()
abstract class LanguagePairClient with BaseClient<LanguagePairDto> {
  factory LanguagePairClient(Dio dio, {String baseUrl}) = _LanguagePairClient;
}
