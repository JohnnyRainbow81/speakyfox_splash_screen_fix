class Location {
  String id; //Take from Google Places or our own? //Generate in backend??
  String streetNumber;
  String streetShort;
  String streetLong;
  String state;
  String zip;
  String city;
  double lat;
  double lng;
  
  Location({
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
}

//Used for Google Places api
class LocationSnippet {
  String id;
  String mainText;
  String secondaryText;
  LocationSnippet({
    required this.id,
    required this.mainText,
    required this.secondaryText,
  });
}
