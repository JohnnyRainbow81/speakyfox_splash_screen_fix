// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/domain/models/database_file.dart';

part 'database_file_response.g.dart';

@JsonSerializable()
class DatabaseFileResponse extends BaseResponse {
  String bucketName;
  String name;
  int size;
  String contentType;
  DatabaseType type;
  List<dynamic>? metadata;

  DatabaseFileResponse({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
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

  factory DatabaseFileResponse.fromJson(Map<String, dynamic> json) => _$DatabaseFileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DatabaseFileResponseToJson(this);
}
