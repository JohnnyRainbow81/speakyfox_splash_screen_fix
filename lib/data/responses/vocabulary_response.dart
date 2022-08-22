// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/animation_image_group_response.dart';
import 'package:speakyfox/data/responses/answer_response.dart';
import 'package:speakyfox/data/responses/audio_response.dart';
import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/image_response.dart';
import 'package:speakyfox/data/responses/language_pair_response.dart';
import 'package:speakyfox/data/responses/sentence_response.dart';

part 'vocabulary_response.g.dart';

@JsonSerializable()
class VocabularyResponse extends BaseResponse {
  String sourceWord;
  String targetWord;
  String mnemonic;
  String sourceSentence;
  String targetSentence;
  SentenceResponse sentence;
  String question;
  String imageNumber;
  String languagePairId;
  LanguagePairResponse languagePair;
  String vocabularyShellId;
  List<AnimationImageGroupResponse> imageGroups;
  List<AnswerResponse> answers;
  List<ImageResponse> images;
  List<AudioResponse> audios;

  VocabularyResponse({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.sourceWord,
    required this.targetWord,
    required this.mnemonic,
    required this.sourceSentence,
    required this.targetSentence,
    required this.sentence,
    required this.question,
    required this.imageNumber,
    required this.languagePairId,
    required this.languagePair,
    required this.vocabularyShellId,
    required this.imageGroups,
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

  factory VocabularyResponse.fromJson(Map<String, dynamic> json) => _$VocabularyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VocabularyResponseToJson(this);
}
