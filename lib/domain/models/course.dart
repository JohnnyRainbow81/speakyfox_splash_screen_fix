// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/base_model.dart';
import 'package:speakyfox/domain/models/class.dart';
import 'package:speakyfox/domain/models/image.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/models/lecture.dart';

class Course extends BaseModel {
  String title;
  String description;
  LanguagePair languagePair;
  String fileId;
  bool isOnboarding;
  String languagePairId;
  Class classs;
  int progress;
  List<Lecture> lectures;
  Image icon;  
  bool isLocked;
  bool isPublished;
  int order;
  String classId;
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
    required this.languagePair,
    required this.fileId,
    required this.isOnboarding,
    required this.languagePairId,
    required this.classs,
    required this.progress,
    required this.lectures,
    required this.icon,
    required this.isLocked,
    required this.isPublished,
    required this.order,
    required this.classId,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
  
}
