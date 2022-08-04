// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocationDTO {
  String id; //Take from Google Places or our own? //Generate in backend??
  String streetNumber;
  String streetShort;
  String streetLong;
  String state;
  String zip;
  String city;
  double lat;
  double lng;
  LocationDTO({
    required this.id,
    required this.streetNumber,
    required this.streetShort,
    required this.streetLong,
    required this.state,
    required this.zip,
    required this.city,
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'streetNumber': streetNumber,
      'streetShort': streetShort,
      'streetLong': streetLong,
      'state': state,
      'zip': zip,
      'city': city,
      'lat': lat,
      'lng': lng,
    };
  }

  factory LocationDTO.fromMap(Map<String, dynamic> map) {
    return LocationDTO(
      id:  map['id'] as String,
      streetNumber: map['streetNumber'] as String,
      streetShort: map['streetShort'] as String,
      streetLong: map['streetLong'] as String,
      state: map['state'] as String,
      zip: map['zip'] as String,
      city: map['city'] as String,
      lat: map['lat'] as double,
      lng: map['lng'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationDTO.fromJson(String source) => LocationDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocationDTO(id: $id, streetNumber: $streetNumber, streetShort: $streetShort, streetLong: $streetLong, state: $state, zip: $zip, city: $city, lat: $lat, lng: $lng)';
  }
}
