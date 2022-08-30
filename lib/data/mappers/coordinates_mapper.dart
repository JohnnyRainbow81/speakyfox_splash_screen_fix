import 'package:speakyfox/data/dtos/coordinates_dto.dart';
import 'package:speakyfox/domain/models/coordinates.dart';

extension CoordinatesMapper on CoordinatesDto {
  Coordinates toCoordinates() {
    return Coordinates(x: x, y: y, height: height ?? 0, width: width ?? 0, degree: degree ?? 0);
  }
}

extension CoordinatesDtoMapper on Coordinates {
  CoordinatesDto toCoordinatesDto() {
    return CoordinatesDto(x: x, y: y);
  }
}
