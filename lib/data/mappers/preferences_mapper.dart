import '../../domain/models/preferences.dart';
import '../dto/preferences_dto.dart';
import 'location_mapper.dart';

extension PreferencesMapper on PreferencesDTO {
  Preferences toDomain() {
    return Preferences(
        firstTimeAppLaunched: firstTimeAppLaunched,
        currentLocation: currentLocation?.toDomain(),
        );
  }
}

extension PreferencesDTOMapper on Preferences {
  PreferencesDTO toDTO() {
    return PreferencesDTO(
        currentLocation: currentLocation?.toDTO(),
        firstTimeAppLaunched: firstTimeAppLaunched
        );
  }
}
