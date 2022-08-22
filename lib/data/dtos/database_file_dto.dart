// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/domain/models/database_file.dart';

part 'database_file_dto.g.dart';

@JsonSerializable()
class DatabaseFileDto extends BaseDto {
  String bucketName;
  String name;
  int size;
  String contentType;
  DatabaseType type;
  List<dynamic>? metadata;

  DatabaseFileDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.bucketName,
    required this.name,
    required this.size,
    required this.contentType,
    required this.type,
    this.metadata,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory DatabaseFileDto.fromJson(Map<String, dynamic> json) => _$DatabaseFileDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DatabaseFileDtoToJson(this);
}
