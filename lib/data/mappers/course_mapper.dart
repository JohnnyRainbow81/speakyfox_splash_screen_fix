import 'package:speakyfox/data/mappers/class_mapper.dart';
import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/mappers/language_pair_mapper.dart';
import 'package:speakyfox/data/mappers/lecture_mapper.dart';
import 'package:speakyfox/data/responses/course_response.dart';
import 'package:speakyfox/domain/models/course.dart';

extension CourseMapper on CourseResponse {
  Course toCourse() {
    return Course(
        id: id,
        modified: modified ??"",
        modifiedBy: modifiedBy ??"",
        created: created ??"",
        createdBy: createdBy ??"",
        deleted: deleted ??"",
        deletedBy: deletedBy ??"",
        title: title,
        description: description,
        languagePair: languagePair.toLanguagePair(),
        fileId: fileId,
        isOnboarding: isOnboarding ?? false,
        languagePairId: languagePairId,
        classs: classs.toClass(),
        progress: progress ?? 0,
        lectures: lectures?.map((lecture) => lecture.toLecture()).toList() ?? [],
        icon: icon.toImage(),
        isLocked: isLocked,
        isPublished: isPublished,
        order: order,
        classId: classId);
  }
}
