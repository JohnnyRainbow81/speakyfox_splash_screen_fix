// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/screen_response.dart';
import 'package:speakyfox/data/responses/sentence_response.dart';
import 'package:speakyfox/data/responses/sentence_shell_response.dart';
import 'package:speakyfox/data/responses/sequence_response.dart';
import 'package:speakyfox/data/responses/vocabulary_response.dart';
import 'package:speakyfox/data/responses/vocabulary_shell_response.dart';
import 'package:speakyfox/domain/models/screen.dart';

part 'game_response.g.dart';

@JsonSerializable()
class GameResponse extends ScreenResponse {

      String instructions;
  GameResponse({
    required String id,
    required this.instructions,
     required String title,
    required String description,
    required int order,
    required ScreenType type,
    required String sequenceId,
    required SequenceResponse sequence,
    required String gameType,
    required List<VocabularyResponse> vocabularies,
    required List<VocabularyShellResponse> vocabularyShells,
    required List<SentenceResponse> sentences,
    required List<SentenceShellResponse> sentenceShells,
  }) : super(description: description, gameType: gameType, id: id, order: order,  sentenceShells: sentenceShells, sentences: sentences ,sequence: sequence,sequenceId: sequenceId,title: title,type: type,vocabularies: vocabularies,vocabularyShells: vocabularyShells);
  

  factory GameResponse extends BaseResponse.fromJson(Map<String, dynamic> json) => _$GameResponse extends BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GameResponse extends BaseResponseToJson(this);
}


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