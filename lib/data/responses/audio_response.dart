// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/database_file_response.dart';

import 'package:speakyfox/data/responses/file_response.dart';
import 'package:speakyfox/domain/models/audio.dart';
import 'package:speakyfox/domain/models/database_file.dart';
import 'package:speakyfox/domain/models/file.dart';

import '../../domain/models/language.dart';

part 'audio_response.g.dart';

@JsonSerializable()
class AudioResponse extends DatabaseFileResponse {
  AudioType audioType;
  LanguageType languageType;
  AudioResponse({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required String bucketName,
    required List<dynamic> metadata,
    required int size,
    required String contentType,
    required String name,
    required DatabaseType type,
    required this.audioType,
    required this.languageType,
  }) : super(
            contentType: contentType,
            id: id,
            name: name,
            size: size,
            type: type,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy,
            bucketName: bucketName,
            metadata: metadata);

  factory AudioResponse.fromJson(Map<String, dynamic> json) => _$AudioResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AudioResponseToJson(this);
}
