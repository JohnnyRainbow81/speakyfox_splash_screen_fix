import 'package:flutter/foundation.dart';
import 'package:places_service/places_service.dart';
import 'preferences_service.dart';

import '../models/location.dart';

//Abstracts away Google Place API
//Checks Google Places API for locations based on user input
class LocationService {
  final PlacesService _placesService; // Google API
  final PreferencesService _preferencesService;

  Location? _currentChosenLocation;

  LocationService(this._placesService, this._preferencesService);

  Future<Location?> get currentChosenLocation async {
    return _currentChosenLocation ?? await _loadChosenLocation();
  }

  Future<List<LocationSnippet>> fetchAutoCompleteResults(String address) async {
    List<LocationSnippet> locations = [];

    if (address.isNotEmpty) {
      List<PlacesAutoCompleteResult> placesResults = [];

      try {
        placesResults = await _placesService.getAutoComplete(address);
      } catch (e) {
        if (kDebugMode) print("Error using GooglePlaces API: $e");
      }

      if (placesResults.isNotEmpty) {
        locations = placesResults.map((result) {
          return LocationSnippet(
              id: result.placeId ?? "", mainText: result.mainText ?? "", secondaryText: result.secondaryText ?? "");
        }).toList();
        return locations;
      }
    }
    return [];
  }

  Future<Location> fetchChosenLocationFrom(LocationSnippet snippet) async {
    //FIXME Bug in Google API?
    final place = await _placesService.getPlaceDetails(snippet.id);
    final location = Location(
        id: place.placeId ?? "", //FIXME generate ID in backend > POST call
        city: place.city ?? "",
        state: place.state ?? "",
        streetLong: place.streetLong ?? "",
        streetNumber: place.streetNumber ?? "",
        streetShort: place.streetShort ?? "",
        zip: place.zip ?? "",
        lat: place.lat ?? 0,
        lng: place.lng ?? 0);
    _currentChosenLocation = location;
    _saveChosenLocation(location);
    return location;
  }

  Future<bool> _saveChosenLocation(Location location) async {
    return _preferencesService.saveLocation(location);
  }

  Future<Location?> _loadChosenLocation() async {
    final Location? location = await _preferencesService.loadLocation();
    return location;
  }
}
