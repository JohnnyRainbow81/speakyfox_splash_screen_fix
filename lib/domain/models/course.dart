// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/class.dart';
import 'package:speakyfox/domain/models/image.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/models/lecture.dart';
import 'package:speakyfox/domain/models/model_base.dart';

class Course extends ModelBase {
  String title;
  String description;
  String? fileId;
  bool isOnboarding;
  String languagePairId;
  Class? classs;
  double progress;
  List<Lecture> lectures;
  Image? icon;
  bool isLocked;
  bool isPublished;
  int order;
  String? classId;
  Course({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.title,
    required this.description,
    this.fileId,
    required this.isOnboarding,
    required this.languagePairId,
    this.classs,
    required this.progress,
    required this.lectures,
    this.icon,
    required this.isLocked,
    required this.isPublished,
    required this.order,
    this.classId,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);



  @override
  String toString() {
    return 'Course(title: $title, description: $description, fileId: $fileId, isOnboarding: $isOnboarding, languagePairId: $languagePairId, classs: $classs, progress: $progress, lectures: $lectures, icon: $icon, isLocked: $isLocked, isPublished: $isPublished, order: $order, classId: $classId)';
  }
}
