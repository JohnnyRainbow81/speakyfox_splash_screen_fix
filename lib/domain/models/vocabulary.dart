// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/animation_image_group.dart';
import 'package:speakyfox/domain/models/answer.dart';
import 'package:speakyfox/domain/models/audio.dart';
import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/image.dart';
import 'package:speakyfox/domain/models/language_pair.dart';

import 'sentence.dart' show Sentence;

class Vocabulary extends ModelBase {
  String sourceWord;
  String targetWord;
  String mnemonic;
  String sourceSentence;
  String targetSentence;
  Sentence sentence;
  String question;
  String imageNumber;
  String languagePairId;
  LanguagePair languagePair;
  String vocabularyShellId;
  List<AnimationImageGroup> imageGroups = [];
  List<Answer> answers = [];
  List<Image> images = [];
  List<Audio> audios = [];
  Vocabulary({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
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
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
