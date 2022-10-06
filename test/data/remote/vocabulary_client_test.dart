import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/remote/vocabulary_client.dart';
import 'package:dio/dio.dart';
import '../../http_client_test_setup.dart';
void main()async {
    Dio dio = await getAuthenticatedHTTPClientForTesting();

  VocabularyClient vocabularyClient = VocabularyClient(dio, baseUrl: "${TestConstants.baseUrlQA}vocabularies");
	group(
		VocabularyClient, 
		() {
			test(
				'',
				() async {
				},
			);
		},
	);
}