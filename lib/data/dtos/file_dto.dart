// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/domain/models/file.dart';

part 'file_dto.g.dart';

@JsonSerializable()
class FileDto extends BaseDto {
  int size;
  String contentType;
  String name;
  FileType type;
  dynamic data;
  
  FileDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.size,
    required this.contentType,
    required this.name,
    required this.type,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory FileDto.fromJson(Map<String, dynamic> json) => _$FileDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FileDtoToJson(this);
}
