import 'package:speakyfox/data/responses/coordinates_response.dart';
import 'package:speakyfox/domain/models/coordinates.dart';

extension CoordinatesMapper on CoordinatesResponse {
  Coordinates toCoordinates() {
    return Coordinates(x: x, y: y, height: height ?? 0, width: width ?? 0, degree: degree ?? 0);
  }
}
