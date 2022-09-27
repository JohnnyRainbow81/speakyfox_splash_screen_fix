import 'package:flutter/foundation.dart';

class Constants {
  //Examples > delete if you don't need

  static const String baseUrlAuthDev = "https://speakyfox-api-production.herokuapp.com/"; //really same as production? > ask Julien 
  static const String baseUrlAuthQA = "https://speakyfox-api-qa.herokuapp.com/";
  static const String baseUrlAuthProd = "https://speakyfox-api-production.herokuapp.com/";

  static const String googlePlacesAPIKey = 'AIzaSyC9cqwvwKY97o786b3E7TMrPg2LoZGq7QM';
  static const int maxCachedVideos = 2;
  static const int videoSwipeOverlayDuration = 5;
  static const int maxLoadVideosRetries = 3;

  static const int emailResendDelay = 30;
}
