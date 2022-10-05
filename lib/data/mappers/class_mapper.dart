import 'package:speakyfox/data/mappers/course_mapper.dart';
import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/dtos/class_dto.dart';
import 'package:speakyfox/data/mappers/language_pair_mapper.dart';
import 'package:speakyfox/domain/models/class.dart';

extension ClassMapper on ClassDto {
  Class toClass() {
    return Class(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        title: title,
        description: description,
        isPublished: isPublished,
        isOnboarding: isOnboarding ?? false,
        progress: progress ?? 0,
        order: order,
        icon: icon?.toImage(),
        fileId: fileId,
        languagePairId: languagePairId,
        isLocked: isLocked,
        languagePair: languagePair.toLanguagePair(),
        courses: courses.map((course) => course.toCourse()).toList());
  }
}
