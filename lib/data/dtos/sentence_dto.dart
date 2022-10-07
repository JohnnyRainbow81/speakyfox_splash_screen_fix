// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/audio_dto.dart';
import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/highlighted_part_dto.dart';
import 'package:speakyfox/data/dtos/image_dto.dart';
import 'package:speakyfox/data/dtos/language_pair_dto.dart';
import 'package:speakyfox/data/dtos/sentence_shell_dto.dart';

part 'sentence_dto.g.dart';

@JsonSerializable()
class SentenceDto extends BaseDto {
  String sentenceShellId;
  SentenceShellDto sentenceShell;
  bool isPublished;
  String languagePairId;
  LanguagePairDto languagePair;
  String sourceNormalized;
  String targetNormalized;
  List<HighlightedPartDto> sourceHighlightedParts;
  List<HighlightedPartDto> targetHighlightedParts;
  List<ImageDto>? images;
  List<AudioDto>? audios;

  SentenceDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.sentenceShellId,
    required this.sentenceShell,
    required this.isPublished,
    required this.languagePairId,
    required this.languagePair,
    required this.sourceNormalized,
    required this.targetNormalized,
    required this.sourceHighlightedParts,
    required this.targetHighlightedParts,
     this.images,
     this.audios,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory SentenceDto.fromJson(Map<String, dynamic> json) => _$SentenceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SentenceDtoToJson(this);
}
