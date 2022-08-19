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
    required int size,
    required String contentType,
    required String name,
    required FileType type,
    required String id,
    required this.audioType,
    required this.languageType,
  }) : super(contentType: contentType, id: id, name: name, size: size, type: type);

  factory AudioResponse.fromJson(Map<String, dynamic> json) => _$AudioResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AudioResponseToJson(this);
}
