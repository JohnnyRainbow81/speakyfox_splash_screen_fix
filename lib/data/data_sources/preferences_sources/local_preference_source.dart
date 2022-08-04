// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/error_handling/exceptions_ui.dart';
import '../../../domain/repositories/preferences_repository.dart';
import '../../dto/preferences_dto.dart';

class LocalPreferencesSource implements PreferencesRepository<PreferencesDTO> {
  static const String prefKey = "prefKey";

  SharedPreferences _sharedPreferences;

  LocalPreferencesSource(
    this._sharedPreferences,
  );

  @override
  Future<bool> init(PreferencesDTO preferences) async {
    if (!_sharedPreferences.containsKey(prefKey)) {
      await _sharedPreferences.setString(prefKey, preferences.toJson());
      return true;
    }
    return false;
  }

  @override
  Future<PreferencesDTO> load() async {
    final json = _sharedPreferences.getString(prefKey);
    if (json != null) {
      return PreferencesDTO.fromJson(json);
    } else {
      throw NoPreferencesFoundException();
    }
  }

  @override
  Future<bool> save(PreferencesDTO preferences) async {
    return await _sharedPreferences.setString(prefKey, preferences.toJson());
  }
}
