// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/file_response.dart';
import 'package:speakyfox/domain/models/audio.dart';
import 'package:speakyfox/domain/models/file.dart';

import '../../domain/models/language.dart';

part 'audio_response.g.dart';

@JsonSerializable()
class AudioResponse extends FileResponse {
  AudioType audioType;
  LanguageType languageType;
  AudioResponse({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required int size,
    required String contentType,
    required String name,
    required FileType type,
    required this.audioType,
    required this.languageType,
  }) : super(contentType: contentType, id: id, name: name, size: size, type: type,created: created,createdBy: createdBy,deleted: deleted,deletedBy: deletedBy,modified: modified,modifiedBy: modifiedBy);

  factory AudioResponse.fromJson(Map<String, dynamic> json) => _$AudioResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AudioResponseToJson(this);
}
