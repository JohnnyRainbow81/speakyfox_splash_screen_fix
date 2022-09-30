import 'package:speakyfox/data/mappers/class_mapper.dart';
import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/mappers/lecture_mapper.dart';
import 'package:speakyfox/data/dtos/course_dto.dart';
import 'package:speakyfox/domain/models/course.dart';

extension CourseMapper on CourseDto {
  Course toCourse() {
    return Course(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        title: title,
        description: description,
        fileId: fileId,
        isOnboarding: isOnboarding ?? false,
        languagePairId: languagePairId,
        classs: classs?.toClass(),
        progress: progress ?? 0,
        lectures: lectures?.map((lecture) => lecture.toLecture()).toList() ?? [],
        icon: icon?.toImage(),
        isLocked: isLocked,
        isPublished: isPublished,
        order: order,
        classId: classId);
  }
}
