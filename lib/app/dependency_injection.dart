import 'package:dio/dio.dart';
import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/data/dio_clients/authentication_client.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/repositories_impls/authentication_repository_impl.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/main.dart';
import 'package:speakyfox/presentation/screens/login/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:places_service/places_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/sources/authorization/authorization_remote_source.dart';
import 'connectivity_service.dart';
import 'constants.dart';

//Global service locator. All dependencies like services, repositories and viewmodels
//should be registered and satisfied with their dependencies here
final locator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  //////////////////////////////////
  //////////initialize general stuff//////////////
  ///
  //Dio http library (used by Retrofit-library)
  Dio dioV1 = isQABackendAvailable
      ? await DioV1.initialize(env.serverUrl)
      : await DioV1.initialize("https://speakyfox-api-production.herokuapp.com/api/v1/");

  Dio dioDocuments = await DioDocuments.initialize(env.documentrApiUrl);
  //TODO dioV2

//////////////////////////////////////
  ///////////Services//////////////

//ConnectivityService
  locator.registerLazySingleton(() => ConnectivityService());

  //AuthenticationService
  locator.registerLazySingleton<AuthenticationClient>(() => AuthenticationClient(dioV1));
  locator.registerLazySingleton<AuthenticationRemoteSource>(() => AuthenticationRemoteSource(locator()));
  locator.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService(locator()));

  //////////////////////////////////////
  ////////////ViewModels//////////////

  //LoginViewModel
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel(locator()));
}
