import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/local/authentication_local_source.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';
import 'package:speakyfox/data/remote/class_client.dart';
import 'package:speakyfox/data/remote/coupon_client.dart';
import 'package:speakyfox/data/repositories_impls/authentication_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/coupon_repository_impl.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';
import 'package:speakyfox/domain/repositories/coupon_repository.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/domain/services/coupon_service.dart';
import 'package:speakyfox/main.dart';
import 'package:speakyfox/presentation/screens/login/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'connectivity_service.dart';

//Global service locator. All dependencies like services, repositories and viewmodels
//should be registered and satisfied with their dependencies here
final locator = GetIt.instance;

//Only the dependencies necessary for authentication get initialized here, because we need to get an authToken first before
//we can initialize other http clients, services etc with that token
Future<void> initializeAuthenticationDependencies() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  Dio dioAuth = isQABackendAvailable
      ? await DioAuth.initialize(env.serverUrlAuth)
      : await DioAuth.initialize("https://speakyfox-api-production.herokuapp.com/");

//AuthenticationService
  locator.registerLazySingleton<AuthenticationClient>(() => AuthenticationClient(dioAuth));
  locator.registerLazySingleton<AuthenticationLocalSource>(() => AuthenticationLocalSource(preferences));
  locator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(locator(), locator(), locator()));
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService(locator()));

  //LoginViewModel
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel(locator()));
}

//this needs to be initialized when Authentication successfully happened and authToken is available
Future<void> initializeDependencies(String token) async {
  //////////initialize general stuff//////////////

  Dio dioV1 = isQABackendAvailable
      ? await DioV1.initialize(env.serverUrl, token)
      : await DioV1.initialize("https://speakyfox-api-production.herokuapp.com/api/v1/", token);

  Dio dioDocuments = await DioDocuments.initialize(env.documentrApiUrl);
  //TODO dioV2

  ///////////Services//////////////

//ConnectivityService
  locator.registerLazySingleton(() => ConnectivityService());

  //CouponService
  locator.registerLazySingleton<CouponClient>(() => CouponClient(dioV1, baseUrl: "${env.serverUrl}coupons"));
  locator.registerLazySingleton<CouponRepository>(() => CouponRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<CouponService>(() => CouponService(locator()));
  //CourseService

  //ClassService
  locator.registerLazySingleton<ClassClient>(() => ClassClient(dioV1,baseUrl: "${env.serverUrl}classes"));
  //FileService

  //AudioService

  //GameSequenceService

  //LanguagePairsService

  //LectureService

  //OffersService

  //OrdersService

  //PlanService

  //ProductService

  //ProgressService

  //SubscriptionsService

  //TokenService

  //UserService

  //VocabularyService

  //VocabularyShellService

  //WordPoolService

  //////////////////////////////////////
  ////////////ViewModels//////////////
}
