// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/dtos/database_file_dto.dart';

import 'package:speakyfox/data/dtos/file_dto.dart';
import 'package:speakyfox/domain/models/audio.dart';
import 'package:speakyfox/domain/models/database_file.dart';
import 'package:speakyfox/domain/models/file.dart';

import '../../domain/models/language.dart';

part 'audio_dto.g.dart';

@JsonSerializable()
class AudioDto extends DatabaseFileDto {
  AudioType audioType;
  LanguageType languageType;
  AudioDto({
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

  factory AudioDto.fromJson(Map<String, dynamic> json) => _$AudioDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AudioDtoToJson(this);
}
