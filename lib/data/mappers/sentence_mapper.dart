import 'package:speakyfox/data/mappers/audio_mapper.dart';
import 'package:speakyfox/data/mappers/highlighted_part_mapper.dart';
import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/mappers/language_pair_mapper.dart';
import 'package:speakyfox/data/mappers/sentence_shell_mapper.dart';
import 'package:speakyfox/data/responses/sentence_response.dart';
import 'package:speakyfox/domain/models/sentence.dart';

extension SentenceMapper on SentenceResponse {
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
        sentenceShell: sentenceShell.toSentenceShell(),
        isPublished: isPublished,
        languagePairId: languagePairId,
        languagePair: languagePair.toLanguagePair(),
        sourceNormalized: sourceNormalized,
        targetNormalized: targetNormalized,
        sourceHighlightedParts: sourceHighlightedParts.map((highlightedPart) => highlightedPart.toHighlightedPart()).toList(),
        targetHighlightedParts: targetHighlightedParts.map((highlightedPart) => highlightedPart.toHighlightedPart()).toList(),
        images: images.map((image) => image.toImage()).toList(),
        audios: audios.map((audio) => audio.toAudio()).toList());
  }
}
