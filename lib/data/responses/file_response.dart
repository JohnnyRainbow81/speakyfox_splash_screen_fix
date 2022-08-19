// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/domain/models/file.dart';

part 'file_response.g.dart';

@JsonSerializable()
class FileResponse extends BaseResponse {
  int size;
  String contentType;
  String name;
  FileType type;

  FileResponse({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
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

  factory FileResponse.fromJson(Map<String, dynamic> json) => _$FileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FileResponseToJson(this);
}
