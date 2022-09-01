import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/dtos/vocabulary_dto.dart';
import 'package:speakyfox/data/remote/base_client.dart';

part 'vocabulary_client.g.dart';

@RestApi()
abstract class VocabularyClient with BaseClient<VocabularyDto> {
  factory VocabularyClient(Dio dio, {String baseUrl}) = _VocabularyClient;

}
