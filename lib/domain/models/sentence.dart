// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/audio.dart';
import 'package:speakyfox/domain/models/base_model.dart';
import 'package:speakyfox/domain/models/highlighted_part.dart';
import 'package:speakyfox/domain/models/image.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/models/sentence_shell.dart';

import "File.dart" show KeyValuePair, Audio, Image;

enum TermType {
  adjective,
  adverb,
  article,
  demonstrativePronoun,
  noun,
  personalPronoun,
  possessivePronoun,
  preposition,
  verb
}

class Sentence extends BaseModel {
  String sentenceShellId;
  SentenceShell sentenceShell;
  bool isPublished;
  String languagePairId;
  LanguagePair languagePair;
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
  }): super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}





