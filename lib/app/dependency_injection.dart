import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/local/authentication_local_source.dart';
import 'package:speakyfox/data/local/user_local_source.dart';
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
import 'package:speakyfox/data/remote/token_client.dart';
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
import 'package:speakyfox/domain/repositories/authentication_repository.dart';
import 'package:speakyfox/domain/services/active_language_service.dart';
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
import 'package:speakyfox/presentation/screens/authentication/authentication_viewmodel.dart';
import 'package:speakyfox/presentation/screens/home/home_viewmodel.dart';
import 'package:speakyfox/presentation/screens/profile/language_selection/language_selection_viewmodel.dart';
import 'package:speakyfox/presentation/screens/profile/my_purchases/my_purchases_viewmodel.dart';
import 'package:speakyfox/presentation/screens/profile/profile_viewmodel.dart';
import 'package:speakyfox/presentation/screens/profile/settings/settings_viewmodel.dart';
import 'package:speakyfox/presentation/screens/profile/unlock/unlock_viewmodel.dart';

import 'connectivity_service.dart';

//Global service locator. All dependencies like services, repositories and viewmodels
//should be registered and satisfied with their dependencies here
final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SharedPreferences>(() => preferences);

  Dio dio = DioFactory.initialize(baseUrl: env.serverUrl);
  locator.registerLazySingleton<Dio>(() => dio);

  //ConnectivityService
  locator.registerLazySingleton<ConnectivityService>(() => ConnectivityService());

//AuthenticationService
  locator.registerLazySingleton<TokenClient>(() => TokenClient(locator(), baseUrl: env.serverUrlAuth));
  locator.registerLazySingleton<UserLocalSource>(() => UserLocalSource(locator())); // not very clean
  locator.registerLazySingleton<AuthenticationClient>(() => AuthenticationClient(locator()));
  locator.registerLazySingleton<AuthenticationLocalSource>(() => AuthenticationLocalSource(locator()));
  locator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(locator(), locator(), locator(), locator(), locator()));
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService(locator()));

//set custom Interceptor when AuthenticationService is ready //FIXME  circular dependency here, waiting for feedback from Julien. Fix via dependency inversion?
  locator<Dio>().interceptors.add(CustomInterceptor(locator(), locator()));

  //CouponService
  locator.registerLazySingleton<CouponClient>(() => CouponClient(locator(), baseUrl: "${env.serverUrl}coupons"));
  locator.registerLazySingleton<CouponRepositoryImpl>(() => CouponRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<CouponService>(() => CouponService(locator()));

  //CourseService
  locator.registerLazySingleton<CourseClient>(() => CourseClient(locator(), baseUrl: "${env.serverUrl}courses"));
  locator.registerLazySingleton<CourseRepositoryImpl>(() => CourseRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<CourseService>(() => CourseService(locator()));

  //ClassService
  locator.registerLazySingleton<ClassClient>(() => ClassClient(locator(), baseUrl: "${env.serverUrl}classes"));
  locator.registerLazySingleton<ClassRepositoryImpl>(() => ClassRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<ClassService>(() => ClassService(locator()));

  //FileService
  locator.registerLazySingleton<FileService>(() => FileService());

  //AudioService
  locator.registerLazySingleton<AudioService>(() => AudioService());

  //GameSequenceService - don't initialize here but individually make a new one depending on the lecture?

  //LanguageService
  locator.registerLazySingleton<LanguageClient>(() => LanguageClient(locator(), baseUrl: "${env.serverUrl}languages"));
  locator.registerLazySingleton<LanguageRepositoryImpl>(() => LanguageRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<LanguageService>(() => LanguageService(locator()));

  //ActiveLanguageService
  locator.registerLazySingleton<ActiveLanguageService>(() => ActiveLanguageService());

  //LanguagePairsService
  locator.registerLazySingleton<LanguagePairClient>(
      () => LanguagePairClient(locator(), baseUrl: "${env.serverUrl}language-pairs"));
  locator.registerLazySingleton<LanguagePairRepositoryImpl>(() => LanguagePairRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<LanguagePairService>(() => LanguagePairService(locator()));

  //LectureService
  locator.registerLazySingleton<LectureClient>(() => LectureClient(locator(), baseUrl: "${env.serverUrl}lectures"));
  locator.registerLazySingleton<LectureRepositoryImpl>(() => LectureRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<LectureService>(() => LectureService(locator()));

  //OffersService
  locator.registerLazySingleton<OfferClient>(() => OfferClient(locator(), baseUrl: "${env.serverUrl}offers"));
  locator.registerLazySingleton<OfferRepositoryImpl>(() => OfferRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<OfferService>(() => OfferService(locator()));

  //OrdersService
  locator.registerLazySingleton<OrderClient>(() => OrderClient(locator(), baseUrl: "${env.serverUrl}orders"));
  locator.registerLazySingleton<OrderRepositoryImpl>(() => OrderRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<OrderService>(() => OrderService(locator(), locator()));

  //PlanService
  locator.registerLazySingleton<PlanClient>(() => PlanClient(locator(), baseUrl: "${env.serverUrl}plans"));
  locator.registerLazySingleton<PlanRepositoryImpl>(() => PlanRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<PlanService>(() => PlanService(locator()));

  //ProductService
  locator.registerLazySingleton<ProductClient>(() => ProductClient(locator(), baseUrl: "${env.serverUrl}products"));
  locator.registerLazySingleton<ProductRepositoryImpl>(() => ProductRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<ProductService>(() => ProductService(locator()));

  //ProgressService
  locator.registerLazySingleton<ProgressClient>(
      () => ProgressClient(locator(), baseUrl: "${env.serverUrl}lectures")); //yea, "lectures", not "progress"
  locator.registerLazySingleton<ProgressRepositoryImpl>(() => ProgressRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<ProgressService>(() => ProgressService(
        locator(),
      ));

  //SubscriptionsService
  locator.registerLazySingleton<SubscriptionClient>(
      () => SubscriptionClient(locator(), baseUrl: "${env.serverUrl}orders")); //yea, "orders", not "subscriptions"
  locator.registerLazySingleton<SubscriptionRepositoryImpl>(() => SubscriptionRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<SubscriptionService>(() => SubscriptionService(locator()));

  //UserService
  locator.registerLazySingleton<UserClient>(() => UserClient(locator(), baseUrl: "${env.serverUrl}users"));
  locator.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl(locator(), locator(), locator()));
  locator.registerLazySingleton<UserService>(() => UserService(locator(), locator()));

  //VocabularyService
  locator.registerLazySingleton<VocabularyClient>(
      () => VocabularyClient(locator(), baseUrl: "${env.serverUrl}vocabularies"));
  locator.registerLazySingleton<VocabularyRepositoryImpl>(() => VocabularyRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<VocabularyService>(() => VocabularyService(locator()));

  //VocabularyShellService

  //WordPoolService

  //TokenService - redudant?

  //////////////////////////////////////
  ////////////ViewModels//////////////

  //AuthenticationViewModel
  locator.registerLazySingleton<AuthenticationViewModel>(() => AuthenticationViewModel(locator()));

//HomeViewModel
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());

  locator.registerLazySingleton<ProfileViewModel>(() => ProfileViewModel(locator()));

  locator.registerLazySingleton<MyPurchasesViewModel>(() => MyPurchasesViewModel());

  locator.registerLazySingleton<UnlockViewModel>(() => UnlockViewModel());

  locator.registerLazySingleton<LanguageSelectionViewModel>(() => LanguageSelectionViewModel(locator(), locator()));

  locator.registerLazySingleton<SettingsViewModel>(() => SettingsViewModel());
}
