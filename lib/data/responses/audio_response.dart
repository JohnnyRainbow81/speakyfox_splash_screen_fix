import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/file_response.dart';
import 'package:speakyfox/domain/models/audio.dart';

import '../../domain/models/language.dart';

part 'audio_response.g.dart';

@JsonSerializable()
class AudioResponse extends FileResponse {
  AudioType audioType;
  LanguageType languageType;

  factory AudioResponse.fromJson(Map<String, dynamic> json) => _$AudioResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AudioResponseToJson(this);
}