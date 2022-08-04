import '../models/location.dart';
import '../models/preferences.dart';
import '../repositories/preferences_repository.dart';

//Saving and loading SharedPrefs. Better save them also remote later!
//when users phone is discharged, crashes, ...
class PreferencesService {
  final PreferencesRepository _preferencesRepository;

  PreferencesService(this._preferencesRepository) {
     _initPreferences();
  }

  Future<bool> _initPreferences() {
    return _preferencesRepository.init(Preferences(firstTimeAppLaunched: true));
  }

//Location
  Future<Location?> loadLocation() async {
    final preferences = await _preferencesRepository.load();
    final location = preferences.currentLocation;
    return location;
  }

  Future<bool> saveLocation(Location location) async {
    final preferences = await _preferencesRepository.load();
    preferences.currentLocation = location;
    return _preferencesRepository.save(preferences);
  }

//isInitial
  Future<void> saveIsFirstTimeAppLaunched(bool value) async {
    final preferences = await _preferencesRepository.load();
    preferences.firstTimeAppLaunched = true;
    _preferencesRepository.save(preferences);
  }

  Future<bool> loadIsFirstTimeAppLaunced() async {
    final preferences = await _preferencesRepository.load();
    return preferences.firstTimeAppLaunched;
  }
}
