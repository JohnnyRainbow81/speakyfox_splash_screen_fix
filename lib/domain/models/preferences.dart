import 'location.dart';

class Preferences {
  bool firstTimeAppLaunched;
  Location? currentLocation;
  Preferences({
    required this.firstTimeAppLaunched,
     this.currentLocation,
  });
}
