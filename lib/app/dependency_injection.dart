import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/data/apis/authentication_client.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/domain/models/video.dart';
import 'package:speakyfox/presentation/screens/videofeed/videofeed_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:places_service/places_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_sources/preferences_sources/local_preference_source.dart';
import '../data/data_sources/preferences_sources/remote_preference_source.dart';
import '../data/data_sources/video_sources/fake_video_source.dart';
import '../data/data_sources/video_sources/local_video_source.dart';
import '../data/data_sources/video_sources/remote_video_source.dart';
import '../data/repositories_impls/preferences_repository_impl.dart';
import '../data/repositories_impls/video_repository_impl.dart';
import '../domain/repositories/preferences_repository.dart';
import '../domain/repositories/video_repository.dart';
import '../domain/services/location_service.dart';
import '../domain/services/preferences_service.dart';
import '../domain/services/videofeed_service.dart';
import 'connectivity_service.dart';
import 'constants.dart';

//Global service locator. All dependencies like services, repositories and viewmodels
//should be registered here
final locator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  ///////////Services//////////////

//ConnectivityService
  locator.registerLazySingleton(() => ConnectivityService());

  //Dio
  locator.registerLazySingleton(() => DioFactory());
  final dio = await locator<DioFactory>().initializeDio();
  locator.registerLazySingleton<AuthenticationClient>(() => AuthenticationClient(dio, baseUrl: env.serverUrlAuth));

//PreferenceService
  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPrefs);
  final remotePreferencesSource = RemotePreferencesSource();
  final localPreferencesSource = LocalPreferencesSource(locator());
  final PreferencesRepository preferencesRepository =
      PreferencesRepositoryImpl(remotePreferencesSource, localPreferencesSource, locator());
  locator.registerLazySingleton(() => preferencesRepository);
  locator.registerLazySingleton<PreferencesService>(() => PreferencesService(locator()));

//VideoFeedService

  final remoteVideoSource = RemoteVideoSource();
  final localVideoSource = LocalVideoSource();
  final fakeVideoSource = FakeVideoSource();
  final VideoRepository<Video> videoRepository =
      VideoRepositoryImpl(remoteVideoSource, localVideoSource, fakeVideoSource, locator());
  locator.registerLazySingleton(() => VideoFeedService(locator(), videoRepository)); //TODO Make VideoFeedService

  //LocationService
  locator.registerLazySingleton(() {
    PlacesService placesService = PlacesService();
    placesService.initialize(apiKey: Constants.googlePlacesAPIKey);
    return placesService;
  });
  locator.registerLazySingleton<LocationService>(() {
    return LocationService(locator(), locator());
  });

  ////////////ViewModels//////////////

//VideoFeedModel
  locator.registerLazySingleton<VideoFeedViewModel>(() => VideoFeedViewModel(locator(), locator()));
}
