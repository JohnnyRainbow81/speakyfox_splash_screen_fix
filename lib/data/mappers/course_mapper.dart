import 'package:speakyfox/data/responses/course_response.dart';
import 'package:speakyfox/domain/models/course.dart';

extension CourseMapper on CourseReponse {
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
        languagePair: languagePair,
        fileId: fileId,
        isOnboarding: isOnboarding ?? false,
        languagePairId: languagePairId,
        classs: classs,
        progress: progress ?? 0,
        lectures: lectures ?? [],
        icon: icon,
        isLocked: isLocked,
        isPublished: isPublished,
        order: order,
        classId: classId);
  }
}
