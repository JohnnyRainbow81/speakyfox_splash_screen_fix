// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/sentence_response.dart';
import 'package:speakyfox/data/responses/sentence_shell_response.dart';
import 'package:speakyfox/data/responses/sequence_response.dart';
import 'package:speakyfox/data/responses/vocabulary_response.dart';
import 'package:speakyfox/data/responses/vocabulary_shell_response.dart';

import '../../domain/models/screen.dart';

part 'screen_response.g.dart';

@JsonSerializable()
class ScreenResponse extends BaseResponse {
  String title;
  String description;
  int order;
  ScreenType type;
  String sequenceId;
  SequenceResponse sequence;
  String gameType; //FIXME   only to Subclass?
  List<VocabularyResponse> vocabularies;
  List<VocabularyShellResponse> vocabularyShells;
  List<SentenceResponse> sentences;
  List<SentenceShellResponse> sentenceShells;
  ScreenResponse({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.title,
    required this.description,
    required this.order,
    required this.type,
    required this.sequenceId,
    required this.sequence,
    required this.gameType,
    required this.vocabularies,
    required this.vocabularyShells,
    required this.sentences,
    required this.sentenceShells,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory ScreenResponse.fromJson(Map<String, dynamic> json) => _$ScreenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ScreenResponseToJson(this);
}
