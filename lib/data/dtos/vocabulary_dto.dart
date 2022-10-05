// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/animation_image_group_dto.dart';
import 'package:speakyfox/data/dtos/answer_dto.dart';
import 'package:speakyfox/data/dtos/audio_dto.dart';
import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/image_dto.dart';
import 'package:speakyfox/data/dtos/language_pair_dto.dart';
import 'package:speakyfox/data/dtos/sentence_dto.dart';

part 'vocabulary_dto.g.dart';

@JsonSerializable()
class VocabularyDto extends BaseDto {
  String sourceWord;
  String targetWord;
  String? mnemonic;
  String sourceSentence;
  String targetSentence;
  SentenceDto? sentence;
  String question;
  String imageNumber;
  String? languagePairId;
  LanguagePairDto? languagePair;
  String vocabularyShellId;
  List<AnimationImageGroupDto>? imageGroups;
  List<AnswerDto> answers;
  List<ImageDto> images;
  List<AudioDto> audios;

  VocabularyDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.sourceWord,
    required this.targetWord,
    this.mnemonic,
    required this.sourceSentence,
    required this.targetSentence,
    this.sentence,
    required this.question,
    required this.imageNumber,
    this.languagePairId,
    this.languagePair,
    required this.vocabularyShellId,
    this.imageGroups,
    required this.answers,
    required this.images,
    required this.audios,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory VocabularyDto.fromJson(Map<String, dynamic> json) => _$VocabularyDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VocabularyDtoToJson(this);
}
