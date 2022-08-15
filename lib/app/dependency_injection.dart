import 'package:dio/dio.dart';
import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/data/data_sources/authorization/authorization_remote_source.dart';
import 'package:speakyfox/data/data_sources/user/user_remote_source.dart';
import 'package:speakyfox/data/dio_clients/authentication_client.dart';
import 'package:speakyfox/data/dio_clients/user_client.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/repositories_impls/authentication_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/user_repository_impl.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';
import 'package:speakyfox/domain/repositories/user_repository.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/domain/services/user_service.dart';
import 'package:speakyfox/main.dart';
import 'package:speakyfox/presentation/screens/login/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:places_service/places_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'connectivity_service.dart';
import 'constants.dart';

//Global service locator. All dependencies like services, repositories and viewmodels
//should be registered and satisfied with their dependencies here
final locator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  //Dio
  //unfortunately 3 instances of Dio are necessary, because we cannot change the base url at runtime
  //(which we need because we have 3 different base urls)
  Dio dioAuth = await DioAuth.initialize(env.serverUrlAuth);

  Dio dioV1 = isQABackendAvailable
      ? await DioV1.initialize(env.serverUrl)
      : await DioV1.initialize("https://speakyfox-api-production.herokuapp.com/api/v1/");

  Dio dioDocuments = await DioDocuments.initialize(env.documentrApiUrl);
  //TODO dioV2

  ///////////Services//////////////

//ConnectivityService
  locator.registerLazySingleton(() => ConnectivityService());

  //Authentication

  locator.registerLazySingleton<AuthenticationClient>(() => AuthenticationClient(dioAuth));
  locator.registerLazySingleton<AuthenticationRemoteSource>(() => AuthenticationRemoteSource(locator()));
  locator.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService(locator()));

//UserClient

  locator.registerLazySingleton<UserClient>(() => UserClient(dioV1));
  locator.registerLazySingleton<RemoteUserSource>(() => RemoteUserSource(locator()));
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<UserService>(() => UserService(locator(), locator()));

  ////////////ViewModels//////////////

  //LoginViewModel
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel(locator()));
}
