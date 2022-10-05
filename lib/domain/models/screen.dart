// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/game.dart';
import 'package:speakyfox/domain/models/sentence.dart';
import 'package:speakyfox/domain/models/sentence_shell.dart';
import 'package:speakyfox/domain/models/vocabulary_shell.dart';

import 'sequence.dart' show Sequence;
import 'vocabulary.dart' show Vocabulary;

enum ScreenType {
  @JsonValue("Game")
  game,
  @JsonValue("Feedback")
  feedback,
  @JsonValue("Tip")
  tip
}

class Screen extends ModelBase {
  String title;
  String description;
  int order;
  ScreenType? screenType;
  String? sequenceId;
  Sequence? sequence;
  GameType gameType; //FIXME   only to Subclass?
  List<Vocabulary> vocabularies;
  List<VocabularyShell>? vocabularyShells;
  List<Sentence>? sentences;
  List<SentenceShell>? sentenceShells;
  Screen({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.title,
    required this.description,
    required this.order,
    this.screenType,
     this.sequenceId,
    this.sequence,
    required this.gameType,
    required this.vocabularies,
    this.vocabularyShells,
    this.sentences,
    this.sentenceShells,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
