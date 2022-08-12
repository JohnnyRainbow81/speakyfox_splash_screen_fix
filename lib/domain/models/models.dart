// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/base_model.dart';

class Course extends BaseModel {
  String title;
  String description;
  Image icon;
  bool isLocked;

  List<Lecture> lectures;

  Course(
      {required String id,
      required DateTime modified,
      required this.title,
      required this.description,
      required this.icon,
      required this.isLocked,
      required this.lectures})
      : super(id: id, modified: modified);
}

class Lecture extends BaseModel {
  String title;
  String description;
  Image icon;
  bool isLocked;
  Course parent;
  List<Sequence> sequences;

  Lecture({
    required String id,
    required DateTime modified,
    required this.title,
    required this.description,
    required this.icon,
    required this.isLocked,
    required this.parent,
    required this.sequences,
  }) : super(id: id, modified: modified);
}

class Image extends BaseModel {
  ImageType type;

  Image({required String id, required DateTime modified, required this.type}) : super(id: id, modified: modified);
}

class File extends BaseModel {
  int size;
  String contentType;
  String name;
  FileType type;

  File({
    required String id,
    required DateTime modified,
    required this.size,
    required this.contentType,
    required this.name,
    required this.type,
  }) : super(id: id, modified: modified);
}

class Sequence extends BaseModel {
  String title;
  String description;
  ProgressType progressType;
  List<Game> games;
  Lecture parent;

  Sequence({
    required String id,
    required DateTime modified,
    required this.title,
    required this.description,
    required this.progressType,
    required this.games,
    required this.parent,
  }) : super(id: id, modified: modified);
}

class Vocabulary extends BaseModel {
  List<Image> images;
  List<Audio> audios;

  String sourceWord;
  String targetWord;
  String sourceSentence;
  String targetSentence;

  String vocabularyShellId;
  String question;
  List<Answer> answers;

  Vocabulary({
    required String id,
    required DateTime modified,
    required this.images,
    required this.audios,
    required this.sourceWord,
    required this.targetWord,
    required this.sourceSentence,
    required this.targetSentence,
    required this.vocabularyShellId,
    required this.question,
    required this.answers,
  }) : super(id: id, modified: modified);
}

class Answer extends BaseModel {
  String title;
  bool isCorrect;
  Answer({
    required String id,
    required DateTime modified,
    required this.title,
    required this.isCorrect,
  }) : super(id: id, modified: modified);
}

class Game extends BaseModel {
  String title;
  String description;
  String instructions;
  GameType type;
  List<Vocabulary> vocabularies;
  Sequence parent;

  Game({
    required String id,
    required DateTime modified,
    required this.title,
    required this.description,
    required this.instructions,
    required this.vocabularies,
    required this.parent,
    required this.type,
  }) : super(id: id, modified: modified);
}

class Audio extends File {
  AudioType audioType;
  LanguageType languageType;
  Audio({
    required String id,
    required DateTime modified,
    required int size,
    required String contentType,
    required String name,
    required FileType type,
    required this.languageType,
    required this.audioType,
  }) : super(id: id, modified: modified, contentType: contentType, name: name, size: size, type: type);
}

class Order extends BaseModel {
  String copy;
  String subscriptionId;
  String effectiveFromUtc;
  String effectiveToUtc;
  String paymentMethod;
  String voucherCode;
  double priceWithoutVAT;
  double finalPriceWithVAT;
  double vat;
  String userId;
  String externalIdentifier;

  Order({
    required String id,
    required DateTime modified,
    required this.copy,
    required this.subscriptionId,
    required this.effectiveFromUtc,
    required this.effectiveToUtc,
    required this.paymentMethod,
    required this.voucherCode,
    required this.priceWithoutVAT,
    required this.finalPriceWithVAT,
    required this.vat,
    required this.userId,
    required this.externalIdentifier,
  }) : super(id: id, modified: modified);
}

class LastLecture extends BaseModel {
  String title;
  String descriptionX;

  LastLecture({
    required String id,
    required DateTime modified,
    required this.title,
    required this.descriptionX,
  }) : super(id: id, modified: modified);
}

class Language extends BaseModel {
  String title;
  String key;
  Image icon;
  Image buttonImage;

  Language({
    required String id,
    required DateTime modified,
    required this.title,
    required this.key,
    required this.icon,
    required this.buttonImage,
  }) : super(id: id, modified: modified);
}

class Class extends BaseModel {
  String title;
  String description;
  List<Course> courses;

  Class({
    required String id,
    required DateTime modified,
    required this.title,
    required this.description,
    required this.courses,
  }) : super(id: id, modified: modified);
}

enum AudioCodingKeys { audioType, languageType }

enum ProgressType { single, whole }

enum LanguageType { sourceLanguage, targetLanguage }

enum AudioType { word, sentence }

enum ImageType { whole, focus }

enum FileType { image, audio }

enum GameType {
  vocabularyImage1A,
  vocabularyImageQuiz1B,
  vocabularyLearned1C,
  chooseTranslation2,
  tapWhatYouHear3,
  matchWords4,
  singleTranslationWord5A,
  singleTranslationSentence5B,
  multipleTranslation6,
  swipingVocabularyImage7,
}

