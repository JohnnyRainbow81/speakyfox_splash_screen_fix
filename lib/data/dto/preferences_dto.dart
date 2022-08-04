// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'location_dto.dart';

class PreferencesDTO {
  bool firstTimeAppLaunched;
  LocationDTO? currentLocation;

  PreferencesDTO({
    required this.firstTimeAppLaunched,
    required this.currentLocation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstTimeAppLaunched': firstTimeAppLaunched,
      'currentLocation': currentLocation?.toMap(),
    };
  }

  factory PreferencesDTO.fromMap(Map<String, dynamic> map) {
    return PreferencesDTO(
      firstTimeAppLaunched: map['firstTimeAppLaunched'] as bool,
      currentLocation:
          map['currentLocation'] != null ? LocationDTO.fromMap(map['currentLocation'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PreferencesDTO.fromJson(String source) => PreferencesDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
