// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/audio_response.dart';
import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/highlighted_part_response.dart';
import 'package:speakyfox/data/responses/image_response.dart';
import 'package:speakyfox/data/responses/language_pair_response.dart';
import 'package:speakyfox/data/responses/sentence_shell_response.dart';
import 'package:speakyfox/domain/models/base_model.dart';

part 'sentence_response.g.dart';

@JsonSerializable()
class SentenceResponse extends BaseResponse {
  String sentenceShellId;
  SentenceShellResponse sentenceShell;
  bool isPublished;
  String languagePairId;
  LanguagePairResponse languagePair;
  String sourceNormalized;
  String targetNormalized;
  List<HighlightedPartResponse> sourceHighlightedParts;
  List<HighlightedPartResponse> targetHighlightedParts;
  List<ImageResponse> images;
  List<AudioResponse> audios;

  SentenceResponse({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.sentenceShellId,
    required this.sentenceShell,
    required this.isPublished,
    required this.languagePairId,
    required this.languagePair,
    required this.sourceNormalized,
    required this.targetNormalized,
    required this.sourceHighlightedParts,
    required this.targetHighlightedParts,
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

  factory SentenceResponse.fromJson(Map<String, dynamic> json) => _$SentenceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SentenceResponseToJson(this);
}
