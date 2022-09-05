import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/local/authentication_local_source.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';
import 'package:speakyfox/data/remote/class_client.dart';
import 'package:speakyfox/data/remote/coupon_client.dart';
import 'package:speakyfox/data/remote/course_client.dart';
import 'package:speakyfox/data/remote/language_client.dart';
import 'package:speakyfox/data/remote/language_pair_client.dart';
import 'package:speakyfox/data/remote/lecture_client.dart';
import 'package:speakyfox/data/remote/offer_client.dart';
import 'package:speakyfox/data/remote/order_client.dart';
import 'package:speakyfox/data/remote/plan_client.dart';
import 'package:speakyfox/data/remote/product_client.dart';
import 'package:speakyfox/data/remote/progress_client.dart';
import 'package:speakyfox/data/remote/subscription_client.dart';
import 'package:speakyfox/data/remote/user_client.dart';
import 'package:speakyfox/data/remote/vocabulary_client.dart';
import 'package:speakyfox/data/repositories_impls/authentication_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/coupon_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/language_pair_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/language_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/lecture_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/offer_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/order_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/plan_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/product_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/progress_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/subscription_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/user_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/vocabulary_repository_impl.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';
import 'package:speakyfox/domain/repositories/coupon_repository.dart';
import 'package:speakyfox/domain/repositories/language_pairs_repository.dart';
import 'package:speakyfox/domain/repositories/language_repository.dart';
import 'package:speakyfox/domain/repositories/lecture_repository.dart';
import 'package:speakyfox/domain/repositories/offer_repository.dart';
import 'package:speakyfox/domain/repositories/order_repository.dart';
import 'package:speakyfox/domain/repositories/plan_repository.dart';
import 'package:speakyfox/domain/repositories/product_repository.dart';
import 'package:speakyfox/domain/repositories/progress_repository.dart';
import 'package:speakyfox/domain/repositories/subscription_repository.dart';
import 'package:speakyfox/domain/repositories/user_repository.dart';
import 'package:speakyfox/domain/repositories/vocabulary_repository.dart';
import 'package:speakyfox/domain/services/audio_service.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/domain/services/coupon_service.dart';
import 'package:speakyfox/domain/services/language_pair_service.dart';
import 'package:speakyfox/domain/services/language_service.dart';
import 'package:speakyfox/domain/services/lecture_service.dart';
import 'package:speakyfox/domain/services/offer_service.dart';
import 'package:speakyfox/domain/services/order_service.dart';
import 'package:speakyfox/domain/services/plan_service.dart';
import 'package:speakyfox/domain/services/product_service.dart';
import 'package:speakyfox/domain/services/progress_service.dart';
import 'package:speakyfox/domain/services/subscription_service.dart';
import 'package:speakyfox/domain/services/user_service.dart';
import 'package:speakyfox/domain/services/vocabulary_service.dart';
import 'package:speakyfox/main.dart';
import 'package:speakyfox/presentation/screens/login/login_viewmodel.dart';

import 'connectivity_service.dart';

//Global service locator. All dependencies like services, repositories and viewmodels
//should be registered and satisfied with their dependencies here
final locator = GetIt.instance;

//Only the dependencies necessary for authentication get initialized here, because we need to get an authToken first before
//we can initialize other http clients, services etc with that token
Future<void> initializeAuthenticationDependencies() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  Dio dioAuth = isQABackendAvailable
      ? await DioAuth.initialize(env.serverUrl)
      //as long as the QA backend doesn't work for authentication testing => take the production backend
      : await DioAuth.initialize("https://speakyfox-api-production.herokuapp.com/api/v1/"); 

  //ConnectivityService
  locator.registerLazySingleton(() => ConnectivityService());

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
  Dio dioV1 = isQABackendAvailable
      ? await DioV1.initialize(env.serverUrl, token)
      //QA backend is not available => take production backend for development
      : await DioV1.initialize("https://speakyfox-api-production.herokuapp.com/api/v1/", token);

  Dio dioDocuments = await DioDocuments.initialize(env.documentrApiUrl); //TODO needed? Not sure yet

  //CouponService
  locator.registerLazySingleton<CouponClient>(() => CouponClient(dioV1, baseUrl: "${dioV1.options.baseUrl}coupons"));
  locator.registerLazySingleton<CouponRepository>(() => CouponRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<CouponService>(() => CouponService(locator(), locator()));

  //CourseService
  locator.registerLazySingleton<CourseClient>(() => CourseClient(dioV1, baseUrl: "${dioV1.options.baseUrl}courses"));
  //ClassService
  locator.registerLazySingleton<ClassClient>(() => ClassClient(dioV1, baseUrl: "${dioV1.options.baseUrl}classes"));
  //FileService

  //AudioService
  locator.registerLazySingleton<AudioService>(() => AudioService());

  //GameSequenceService - don't initialize here but individually make a new one depending on the lecture?

  //LanguageService
  locator
      .registerLazySingleton<LanguageClient>(() => LanguageClient(dioV1, baseUrl: "${dioV1.options.baseUrl}languages"));
  locator.registerLazySingleton<LanguageRepository>(() => LanguageRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<LanguageService>(() => LanguageService(locator(), locator()));

  //LanguagePairsService
  locator.registerLazySingleton<LanguagePairClient>(
      () => LanguagePairClient(dioV1, baseUrl: "${dioV1.options.baseUrl}language-pairs"));
  locator.registerLazySingleton<LanguagePairRepository>(() => LanguagePairRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<LanguagePairService>(() => LanguagePairService(locator(), locator()));

  //LectureService
  locator.registerLazySingleton<LectureClient>(() => LectureClient(dioV1, baseUrl: "${dioV1.options.baseUrl}lectures"));
  locator.registerLazySingleton<LectureRepository>(() => LectureRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<LectureService>(() => LectureService(locator(), locator()));

  //OffersService
  locator.registerLazySingleton<OfferClient>(() => OfferClient(dioV1, baseUrl: "${dioV1.options.baseUrl}offers"));
  locator.registerLazySingleton<OfferRepository>(() => OfferRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<OfferService>(() => OfferService(locator()));

  //OrdersService
  locator.registerLazySingleton<OrderClient>(() => OrderClient(dioV1, baseUrl: "${dioV1.options.baseUrl}orders"));
  locator.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<OrderService>(() => OrderService(locator(), locator()));

  //PlanService
  locator.registerLazySingleton<PlanClient>(() => PlanClient(dioV1, baseUrl: "${dioV1.options.baseUrl}plans"));
  locator.registerLazySingleton<PlanRepository>(() => PlanRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<PlanService>(() => PlanService(locator()));

  //ProductService
  locator.registerLazySingleton<ProductClient>(() => ProductClient(dioV1, baseUrl: "${dioV1.options.baseUrl}products"));
  locator.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<ProductService>(() => ProductService(locator(), locator()));

  //ProgressService
  locator.registerLazySingleton<ProgressClient>(
      () => ProgressClient(dioV1, baseUrl: "${dioV1.options.baseUrl}lectures")); //yea, "lectures", not "progress"
  locator.registerLazySingleton<ProgressRepository>(() => ProgressRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<ProgressService>(() => ProgressService(
        locator(),
      ));

  //SubscriptionsService
  locator.registerLazySingleton<SubscriptionClient>(
      () => SubscriptionClient(dioV1, baseUrl: "${dioV1.options.baseUrl}orders")); //yea, "orders", not "subscriptions"
  locator.registerLazySingleton<SubscriptionRepository>(() => SubscriptionRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<SubscriptionService>(() => SubscriptionService(locator(), locator()));

  //UserService
  locator.registerLazySingleton<UserClient>(() => UserClient(dioV1, baseUrl: "${dioV1.options.baseUrl}users"));
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<UserService>(() => UserService(locator(), locator(), locator()));

  //VocabularyService
  locator.registerLazySingleton<VocabularyClient>(
      () => VocabularyClient(dioV1, baseUrl: "${dioV1.options.baseUrl}vocabularies"));
  locator.registerLazySingleton<VocabularyRepository>(() => VocabularyRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<VocabularyService>(() => VocabularyService(locator(), locator()));

  //VocabularyShellService

  //WordPoolService

  //TokenService - redudant?

  //////////////////////////////////////
  ////////////ViewModels//////////////
}
