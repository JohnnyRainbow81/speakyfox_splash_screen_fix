import '../../domain/models/location.dart';
import '../dto/location_dto.dart';

extension LocationMapper on LocationDTO {
  Location toDomain() {
    return Location(
        id: id,
        streetNumber: streetNumber,
        streetShort: streetShort,
        streetLong: streetLong,
        state: state,
        zip: zip,
        city: city,
        lat: lat,
        lng: lng);
  }
}

extension LocationDTOMapper on Location {
  LocationDTO toDTO() {
    return LocationDTO(
        id: id,
        streetNumber: streetNumber,
        streetShort: streetShort,
        streetLong: streetLong,
        state: state,
        zip: zip,
        city: city,
        lat: lat,
        lng: lng);
  }
}
