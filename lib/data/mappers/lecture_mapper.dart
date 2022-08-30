import 'package:speakyfox/data/mappers/course_mapper.dart';
import 'package:speakyfox/data/mappers/language_pair_mapper.dart';
import 'package:speakyfox/data/mappers/offer_mapper.dart';
import 'package:speakyfox/data/mappers/sequence_mapper.dart';
import 'package:speakyfox/data/dtos/lecture_dto.dart';
import 'package:speakyfox/domain/models/lecture.dart';

extension LectureMapper on LectureDto {
  Lecture toLecture() {
    return Lecture(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        title: title,
        languagePairId: languagePairId,
        description: description,
        isOnboarding: isOnboarding ?? false, //If null then set to false or true?? > ask Julien
        languagePair: languagePair?.toLanguagePair(),
        isPublished: isPublished,
        isLocked: isLocked,
        order: order,
        course: course?.toCourse(),
        progress: progress,
        offer: offer?.toOffer(),
        offerId: offerId,
        courseId: courseId,
        sequences: sequences.map((sequence) => sequence.toSequence()).toList());
  }
}

extension LectureDtoMapper on Lecture {
  LectureDto toLectureDto() {
    return LectureDto(
        id: id ?? "",
        title: title,
        languagePairId: languagePairId,
        description: description,
        isOnboarding: isOnboarding,
        languagePair: languagePair?.toLanguagePairDto(),
        isPublished: isPublished,
        isLocked: isLocked,
        progress: progress,
        courseId: courseId,
        sequences: sequences.map((e) => e.toSequenceDto()).toList());
  }
}
