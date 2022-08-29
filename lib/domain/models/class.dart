// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/course.dart';
import 'package:speakyfox/domain/models/image.dart';

class Class extends ModelBase {
  String title;
  String description;
  bool isPublished;
  bool isOnboarding;
  int progress;
  int order;
  Image icon;
  String fileId;
  String languagePairId;
  bool isLocked;
  String languagePair; //FIXME type!
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
    required this.icon,
    required this.fileId,
    required this.languagePairId,
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
}
