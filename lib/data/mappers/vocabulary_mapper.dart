import 'package:speakyfox/data/mappers/animation_image_group_mapper.dart';
import 'package:speakyfox/data/mappers/answer_mapper.dart';
import 'package:speakyfox/data/mappers/audio_mapper.dart';
import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/mappers/language_pair_mapper.dart';
import 'package:speakyfox/data/mappers/sentence_mapper.dart';
import 'package:speakyfox/data/dtos/vocabulary_dto.dart';
import 'package:speakyfox/domain/models/vocabulary.dart';

extension VocabularyMapper on VocabularyDto {
  Vocabulary toVocabulary() {
    return Vocabulary(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        sourceWord: sourceWord,
        targetWord: targetWord,
        mnemonic: mnemonic ?? "",
        sourceSentence: sourceSentence,
        targetSentence: targetSentence,
        sentence: sentence?.toSentence(),
        question: question,
        imageNumber: imageNumber,
        languagePairId: languagePairId,
        languagePair: languagePair?.toLanguagePair(),
        vocabularyShellId: vocabularyShellId,
        imageGroups: imageGroups?.map((animationImageGroup) => animationImageGroup.toAnimationImageGroup()).toList(),
        answers: answers.map((answer) => answer.toAnswer()).toList(),
        images: images.map((image) => image.toImage()).toList(),
        audios: audios.map((audio) => audio.toAudio()).toList());
  }
}

extension VocabularyDtoMapper on Vocabulary {
  VocabularyDto toVocabularyDto() {
    return VocabularyDto(
        id: id,
        sourceWord: sourceWord,
        targetWord: targetWord,
        mnemonic: mnemonic,
        sourceSentence: sourceSentence,
        targetSentence: targetSentence,
        sentence: sentence?.toSentenceDto(),
        question: question,
        imageNumber: imageNumber,
        languagePairId: languagePairId,
        languagePair: languagePair?.toLanguagePairDto(),
        vocabularyShellId: vocabularyShellId,
        imageGroups: imageGroups?.map((e) => e.toAnimationImageGroupDto()).toList(),
        answers: answers.map((e) => e.toAnswerDto()).toList(),
        images: images.map((e) => e.toImageDto()).toList(),
        audios: audios.map((e) => e.toAudioDto()).toList());
  }
}
