// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_starterkit/data/mappers/preferences_mapper.dart';
import 'package:flutter_starterkit/domain/repositories/preferences_repository.dart';
import '../../app/connectivity_service.dart';
import '../../domain/models/preferences.dart';
import '../data_sources/preferences_sources/local_preference_source.dart';
import '../data_sources/preferences_sources/remote_preference_source.dart';

//Here all Caching / Remote / etc logic
class PreferencesRepositoryImpl implements PreferencesRepository<Preferences> {
  final RemotePreferencesSource _remotePreferenceSource;
  final LocalPreferencesSource _localPreferenceSource;
  final ConnectivityService _connectivityService;

  PreferencesRepositoryImpl(
    this._remotePreferenceSource,
    this._localPreferenceSource,
    this._connectivityService,
  );

  @override
  Future<bool> init(Preferences preferences) {
    //Add remote logic etc
    return _localPreferenceSource.init(preferences.toDTO());
  }

  @override
  Future<Preferences> load() async {
    //Add remote logic etc
    final prefDTO = await _localPreferenceSource.load();
    return prefDTO.toDomain();
  }

  @override
  Future<bool> save(Preferences preferences) async{
    //Add remote logic etc
    return await _localPreferenceSource.save(preferences.toDTO());
  }
}
