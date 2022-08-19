// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/coordinates_response.dart';
import 'package:speakyfox/data/responses/database_file_response.dart';
import 'package:speakyfox/domain/models/database_file.dart';
import 'package:speakyfox/domain/models/image.dart';

part 'image_response.g.dart';

@JsonSerializable()
class ImageResponse extends DatabaseFileResponse {
  ImageType imageType;
  int order;
  CoordinatesResponse coordinates;

  ImageResponse({
    required String bucketName,
    required String name,
    required int size,
    required String contentType,
    required DatabaseType type,
    required List<dynamic>? metadata,
    required String id,
    required this.imageType,
    required this.order,
    required this.coordinates,
  }) : super(id: id, bucketName: bucketName, contentType: contentType, name: name, size: size, type: type);

  factory ImageResponse.fromJson(Map<String, dynamic> json) => _$ImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}
