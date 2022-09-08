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
import 'package:speakyfox/data/repositories_impls/class_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/coupon_repository_impl.dart';
import 'package:speakyfox/data/repositories_impls/course_repository_impl.dart';
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
import 'package:speakyfox/domain/models/language.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/coupon_repository.dart';
import 'package:speakyfox/domain/repositories/language_pair_repository.dart';
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
import 'package:speakyfox/domain/services/class_service.dart';
import 'package:speakyfox/domain/services/coupon_service.dart';
import 'package:speakyfox/domain/services/course_service.dart';
import 'package:speakyfox/domain/services/file_service.dart';
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
import 'package:speakyfox/presentation/screens/home/home_viewmodel.dart';
import 'package:speakyfox/presentation/screens/login/login_viewmodel.dart';

import 'connectivity_service.dart';

//Global service locator. All dependencies like services, repositories and viewmodels
//should be registered and satisfied with their dependencies here
final locator = GetIt.instance;

//Only the dependencies necessary for authentication get initialized here, because we need to get an authToken first before
//we can initialize other http clients, services etc with that token
Future<void> initializeDependencies() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SharedPreferences>(() => preferences);
  Dio dio = isQABackendAvailable
      ? await DioV1.initialize(env.serverUrl)
      //as long as the QA backend doesn't work for authentication testing => take the production backend
      : await DioV1.initialize("https://speakyfox-api-production.herokuapp.com/api/v1/");

  //ConnectivityService
  locator.registerLazySingleton<ConnectivityService>(() => ConnectivityService());

//AuthenticationService
  locator.registerLazySingleton<AuthenticationClient>(() => AuthenticationClient(dio));
  locator.registerLazySingleton<AuthenticationLocalSource>(() => AuthenticationLocalSource(locator()));
  locator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(locator(), locator(), locator()));
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService(locator()));

  //LoginViewModel
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel(locator()));

  //CouponService
  locator.registerLazySingleton<CouponClient>(() => CouponClient(dio, baseUrl: "${dio.options.baseUrl}coupons"));
  locator.registerLazySingleton<CouponRepositoryImpl>(() => CouponRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<CouponService>(() => CouponService(locator()));

  //CourseService
  locator.registerLazySingleton<CourseClient>(() => CourseClient(dio, baseUrl: "${dio.options.baseUrl}courses"));
  locator.registerLazySingleton<CourseRepositoryImpl>(() => CourseRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<CourseService>(() => CourseService(locator()));

  //ClassService
  locator.registerLazySingleton<ClassClient>(() => ClassClient(dio, baseUrl: "${dio.options.baseUrl}classes"));
  locator.registerLazySingleton<ClassRepositoryImpl>(() => ClassRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<ClassService>(() => ClassService(locator()));

  //FileService
  locator.registerLazySingleton<FileService>(() => FileService());

  //AudioService
  locator.registerLazySingleton<AudioService>(() => AudioService());

  //GameSequenceService - don't initialize here but individually make a new one depending on the lecture?

  //LanguageService
  locator.registerLazySingleton<LanguageClient>(() => LanguageClient(dio, baseUrl: "${dio.options.baseUrl}languages"));
  locator.registerLazySingleton<LanguageRepositoryImpl>(() => LanguageRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<LanguageService>(() => LanguageService(locator()));

  //LanguagePairsService
  locator.registerLazySingleton<LanguagePairClient>(
      () => LanguagePairClient(dio, baseUrl: "${dio.options.baseUrl}language-pairs"));
  locator.registerLazySingleton<LanguagePairRepositoryImpl>(() => LanguagePairRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<LanguagePairService>(() => LanguagePairService(locator()));

  //LectureService
  locator.registerLazySingleton<LectureClient>(() => LectureClient(dio, baseUrl: "${dio.options.baseUrl}lectures"));
  locator.registerLazySingleton<LectureRepositoryImpl>(() => LectureRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<LectureService>(() => LectureService(locator()));

  //OffersService
  locator.registerLazySingleton<OfferClient>(() => OfferClient(dio, baseUrl: "${dio.options.baseUrl}offers"));
  locator.registerLazySingleton<OfferRepositoryImpl>(() => OfferRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<OfferService>(() => OfferService(locator()));

  //OrdersService
  locator.registerLazySingleton<OrderClient>(() => OrderClient(dio, baseUrl: "${dio.options.baseUrl}orders"));
  locator.registerLazySingleton<OrderRepositoryImpl>(() => OrderRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<OrderService>(() => OrderService(locator(), locator()));

  //PlanService
  locator.registerLazySingleton<PlanClient>(() => PlanClient(dio, baseUrl: "${dio.options.baseUrl}plans"));
  locator.registerLazySingleton<PlanRepositoryImpl>(() => PlanRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<PlanService>(() => PlanService(locator()));

  //ProductService
  locator.registerLazySingleton<ProductClient>(() => ProductClient(dio, baseUrl: "${dio.options.baseUrl}products"));
  locator.registerLazySingleton<ProductRepositoryImpl>(() => ProductRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<ProductService>(() => ProductService(locator()));

  //ProgressService
  locator.registerLazySingleton<ProgressClient>(
      () => ProgressClient(dio, baseUrl: "${dio.options.baseUrl}lectures")); //yea, "lectures", not "progress"
  locator.registerLazySingleton<ProgressRepositoryImpl>(() => ProgressRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<ProgressService>(() => ProgressService(
        locator(),
      ));

  //SubscriptionsService
  locator.registerLazySingleton<SubscriptionClient>(
      () => SubscriptionClient(dio, baseUrl: "${dio.options.baseUrl}orders")); //yea, "orders", not "subscriptions"
  locator.registerLazySingleton<SubscriptionRepositoryImpl>(() => SubscriptionRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<SubscriptionService>(() => SubscriptionService(locator()));

  //UserService
  locator.registerLazySingleton<UserClient>(() => UserClient(dio, baseUrl: "${dio.options.baseUrl}users"));
  locator.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<UserService>(() => UserService(locator(), locator()));

  //VocabularyService
  locator.registerLazySingleton<VocabularyClient>(
      () => VocabularyClient(dio, baseUrl: "${dio.options.baseUrl}vocabularies"));
  locator.registerLazySingleton<VocabularyRepositoryImpl>(() => VocabularyRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<VocabularyService>(() => VocabularyService(locator()));

  //VocabularyShellService

  //WordPoolService

  //TokenService - redudant?

  //////////////////////////////////////
  ////////////ViewModels//////////////

  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
}
