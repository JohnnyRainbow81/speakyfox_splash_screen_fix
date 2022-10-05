// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/course.dart';
import 'package:speakyfox/domain/models/image.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/models/model_base.dart';

class Class extends ModelBase {
  String title;
  String description;
  bool isPublished;
  bool isOnboarding;
  int progress;
  int order;
  Image? icon;
  String? fileId;
  String? languagePairId;
  bool isLocked;
  LanguagePair languagePair; //FIXME type!
  List<Course> courses;
  Class({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.title,
    required this.description,
    required this.isPublished,
    required this.isOnboarding,
    required this.progress,
    required this.order,
    this.icon,
    required this.fileId,
    this.languagePairId,
    required this.isLocked,
    required this.languagePair,
    required this.courses,
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
    return 'Class(title: $title, description: $description, isPublished: $isPublished, isOnboarding: $isOnboarding, progress: $progress, order: $order, icon: $icon, fileId: $fileId, languagePairId: $languagePairId, isLocked: $isLocked, languagePair: $languagePair, courses: $courses)';
  }
}
