import 'package:speakyfox/domain/models/base_model.dart';
import 'package:speakyfox/domain/models/language_pair.dart';

import "course.dart" show Course;
import 'sequence.dart' show Sequence;
import 'offer.dart' show Offer;

class Lecture extends BaseModel {
  String title;
  String languagePairId;
  String description;
  bool isOnboarding;
  LanguagePair languagePair;
  bool isPublished;
  bool isLocked;
  int order;
  Course course;
  int progress;
  Offer offer;
  String offerId;
  String courseId;
  List<Sequence> sequences = [];

  Lecture(
      {required String id,
      String? modified,
      String? modifiedBy,
      String? created,
      String? createdBy,
      String? deleted,
      String? deletedBy,
      required this.title,
      required this.languagePairId,
      required this.description,
      required this.isOnboarding,
      required this.languagePair,
      required this.isPublished,
      required this.isLocked,
      required this.order,
      required this.course,
      required this.progress,
      required this.offer,
      required this.offerId,
      required this.courseId,
      required this.sequences})
      : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
