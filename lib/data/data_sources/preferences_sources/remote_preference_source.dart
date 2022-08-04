import '../../../domain/repositories/preferences_repository.dart';
import '../../dto/preferences_dto.dart';

class RemotePreferencesSource implements PreferencesRepository<PreferencesDTO> {
  @override
  Future<bool> init(PreferencesDTO preferences) {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<PreferencesDTO> load() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<bool> save(PreferencesDTO preferences) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
