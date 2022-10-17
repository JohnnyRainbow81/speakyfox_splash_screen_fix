// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/domain/models/audio.dart';
import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/highlighted_part.dart';
import 'package:speakyfox/domain/models/image.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/models/sentence_shell.dart';

enum TermType {
  @JsonValue("adjective")
  adjective,
  @JsonValue("adverb")
  adverb,
  @JsonValue("article")
  article,
  @JsonValue("demonstrativePronoun")
  demonstrativePronoun,
  @JsonValue("noun")
  noun,
  @JsonValue("personalPronoun")
  personalPronoun,
  @JsonValue("possessivePronoun")
  possessivePronoun,
  @JsonValue("preposition")
  preposition,
  @JsonValue("verb")
  verb
}

class Sentence extends ModelBase {
  String sentenceShellId;
  SentenceShell? sentenceShell;
  bool isPublished;
  String? languagePairId;
  LanguagePair? languagePair;
  String sourceNormalized;
  String targetNormalized;
  List<HighlightedPart> sourceHighlightedParts = [];
  List<HighlightedPart> targetHighlightedParts = [];
  List<Image> images = [];
  List<Audio> audios = [];

  Sentence({
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
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
