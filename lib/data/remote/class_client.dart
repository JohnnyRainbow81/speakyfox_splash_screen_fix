import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/class_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/remote/base_client.dart';
part 'class_client.g.dart';

@RestApi()
abstract class ClassClient with BaseClient<ClassDto> {
  factory ClassClient(Dio dio, {String baseUrl}) = _ClassClient;
}
