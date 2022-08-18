// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesResponse _$CoordinatesResponseFromJson(Map<String, dynamic> json) =>
    CoordinatesResponse(
      x: json['x'] as int,
      y: json['y'] as int,
      height: json['height'] as int?,
      width: json['width'] as int?,
      degree: json['degree'] as int?,
    );

Map<String, dynamic> _$CoordinatesResponseToJson(
        CoordinatesResponse instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'height': instance.height,
      'width': instance.width,
      'degree': instance.degree,
    };
