import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/language_client.dart';
import 'package:speakyfox/data/repositories_impls/language_repository_impl.dart';
import 'package:speakyfox/domain/services/language_service.dart';

import '../../http_client_test_setup.dart';
import 'language_service_test.mocks.dart';

@GenerateMocks([ConnectivityService])
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = await getAuthenticatedHTTPClientForTesting();

  LanguageClient languageClient = LanguageClient(dio);

  //Let's mock ConnectivityService because it cries about not finding the Method Channel. Hopefully it works on the target platforms...
  final mockConnectivityService = MockConnectivityService();

  LanguageRepositoryImpl languageRepository = LanguageRepositoryImpl(mockConnectivityService, languageClient);
  LanguageService languageService = LanguageService(languageRepository);

  test('getLanguageById()', () async {
    when(mockConnectivityService.hasConnection()).thenAnswer((_) async => true);
    final language = await languageService.getLanguageById("02c6e388-bcb1-427b-8b8d-d49704671c22");

    debugPrint(language.toString());
  });
}
