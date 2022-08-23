import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/mappers/language_mapper.dart';
import 'package:speakyfox/data/remote/language_client.dart';
import 'package:speakyfox/domain/models/language.dart';

import '../../test_get_access_token.dart';

void main() async {
  String token = await testGetAuthToken();

  final dioV1 = await DioV1.initialize("", token);
  LanguageClient languageClient =
      LanguageClient(dioV1, baseUrl: "https://speakyfox-api-production.herokuapp.com/api/v1/languages/");

  test('getLanguageById', () async {
    final response = await languageClient.getLanguageById("02c6e388-bcb1-427b-8b8d-d49704671c22");
    Language language = response.data.toLanguage();
    print(language.toString());
  });
}

//https://speakyfox-api-production.herokuapp.com/api/v1/languages/02c6e388-bcb1-427b-8b8d-d49704671c22