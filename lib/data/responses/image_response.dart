// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/coordinates_response.dart';
import 'package:speakyfox/domain/models/image.dart';

part 'image_response.g.dart';

@JsonSerializable()
class ImageResponse extends BaseResponse {
  ImageType imageType;
  int order;
  CoordinatesResponse coordinates;
  
  ImageResponse({
    required String id,
    required this.imageType,
    required this.order,
    required this.coordinates,
  }) : super(id: id);

  factory ImageResponse.fromJson(Map<String, dynamic> json) => _$ImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}
