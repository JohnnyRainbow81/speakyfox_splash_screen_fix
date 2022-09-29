import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/mappers/language_mapper.dart';
import 'package:speakyfox/data/remote/language_client.dart';
import 'package:speakyfox/domain/models/language.dart';

import '../../test_get_access_token.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  String token = await getAuthTokenForTesting();
  final dioV1 =  DioFactory.initialize(baseUrl:Constants.baseUrlAuthQA);
  LanguageClient languageClient =
      LanguageClient(dioV1, baseUrl: "https://speakyfox-api-production.herokuapp.com/api/v1/languages");

  test('getLanguageById', () async {
    final response = await languageClient.getLanguageById("02c6e388-bcb1-427b-8b8d-d49704671c22");
    Language language = response.data.toLanguage();
    print(language.toString());
  });

  test("getTargetLanguages", () async {
    final response = await languageClient.getTargetLanguages();
    List<Language> languages = response.data.map((e) => e.toLanguage()).toList();
    print(languages.isEmpty ? "empty" : languages.toString());
  });

  test("getTargetLanguagesBySourceLanguageId", () async {
    final response = await languageClient.getTargetLanguagesBySourceLanguageId("02c6e388-bcb1-427b-8b8d-d49704671c22");
    List<Language> languages = response.data.map((e) => e.toLanguage()).toList();
    print(languages.isEmpty ? "empty" : languages.toString());
  });

  test("getAll", () async {
    final response = await languageClient.getAll("");
    List<Language> languages = response.data.map((e) => e.toLanguage()).toList();
    print(languages.isEmpty ? "empty" : languages.toString());
  });

  test("getById", () async {
    final response = await languageClient.getById("02c6e388-bcb1-427b-8b8d-d49704671c22");
    Language language = response.data.toLanguage();
    print(language.toString());
  });

  test("post", () async {
    //Doesn't work for Role=User
  });

  test("patchById", () async {
    //Doesn't work for Role=User
  });

  test("removeById", () async {
    //Doesn't work for Role=User
  });
}

//https://speakyfox-api-production.herokuapp.com/api/v1/languages/02c6e388-bcb1-427b-8b8d-d49704671c22

  // @GET("")
  // Future<Response<List<T>>> getAll(@Query("") String param);

  // @GET("")
  // Future<Response<T>> getById(@Query("id") String id);

  // @POST("")
  // Future<Response<T>> post(@Body()dynamic entity);

  // @PATCH("")
  // Future<Response<T>> patchById(@Query("id") String id, @Body() dynamic entity);  //FIXME Linter wants "dynamic" instead of "T" here?!

  // @DELETE("")
  // Future<Response<bool>> removeById(@Query("id") String id);