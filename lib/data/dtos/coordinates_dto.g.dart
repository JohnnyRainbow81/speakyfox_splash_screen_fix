// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesDto _$CoordinatesDtoFromJson(Map<String, dynamic> json) =>
    CoordinatesDto(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      degree: (json['degree'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesDtoToJson(CoordinatesDto instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'height': instance.height,
      'width': instance.width,
      'degree': instance.degree,
    };
