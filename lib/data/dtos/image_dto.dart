// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/coordinates_dto.dart';
import 'package:speakyfox/data/dtos/database_file_dto.dart';
import 'package:speakyfox/domain/models/database_file.dart';
import 'package:speakyfox/domain/models/image.dart';

part 'image_dto.g.dart';

@JsonSerializable()
class ImageDto extends DatabaseFileDto {
  ImageType? imageType;
  int? order;
  CoordinatesDto? coordinates;

  ImageDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    String? bucketName,
    required String name,
    required int size,
    required String contentType,
    required DatabaseType type,
    required dynamic metadata,
    required this.imageType,
    this.order,
    required this.coordinates,
  }) : super(
            id: id,
            bucketName: bucketName,
            contentType: contentType,
            name: name,
            size: size,
            type: type,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory ImageDto.fromJson(Map<String, dynamic> json) => _$ImageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);
}
