import 'package:speakyfox/data/mappers/audio_mapper.dart';
import 'package:speakyfox/data/mappers/highlighted_part_mapper.dart';
import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/mappers/language_pair_mapper.dart';
import 'package:speakyfox/data/mappers/sentence_shell_mapper.dart';
import 'package:speakyfox/data/dtos/sentence_dto.dart';
import 'package:speakyfox/domain/models/sentence.dart';

extension SentenceMapper on SentenceDto {
  Sentence toSentence() {
    return Sentence(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        sentenceShellId: sentenceShellId,
        sentenceShell: sentenceShell?.toSentenceShell(),
        isPublished: isPublished,
        languagePairId: languagePairId,
        languagePair: languagePair?.toLanguagePair(),
        sourceNormalized: sourceNormalized,
        targetNormalized: targetNormalized,
        sourceHighlightedParts:
            sourceHighlightedParts?.map((highlightedPart) => highlightedPart.toHighlightedPart()).toList() ?? [],
        targetHighlightedParts:
            targetHighlightedParts?.map((highlightedPart) => highlightedPart.toHighlightedPart()).toList() ?? [],
        images: images != null ? images!.map((image) => image.toImage()).toList() : [],
        audios: audios != null ? audios!.map((audio) => audio.toAudio()).toList() : []);
  }
}

extension SentenceDtoMapper on Sentence {
  SentenceDto toSentenceDto() {
    return SentenceDto(
        id: id,
        sentenceShellId: sentenceShellId,
        sentenceShell: sentenceShell?.toSentenceShellDto(),
        isPublished: isPublished,
        languagePairId: languagePairId,
        languagePair: languagePair?.toLanguagePairDto(),
        sourceNormalized: sourceNormalized,
        targetNormalized: targetNormalized,
        sourceHighlightedParts: sourceHighlightedParts.map((e) => e.toHighlightedPartDto()).toList(),
        targetHighlightedParts: targetHighlightedParts.map((e) => e.toHighlightedPartDto()).toList(),
        images: images.map((e) => e.toImageDto()).toList(),
        audios: audios.map((e) => e.toAudioDto()).toList());
  }
}
