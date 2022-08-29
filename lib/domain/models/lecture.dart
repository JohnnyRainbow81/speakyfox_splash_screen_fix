import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/language_pair.dart';

import "course.dart" show Course;
import 'sequence.dart' show Sequence;
import 'offer.dart' show Offer;

class Lecture extends ModelBase {
  String title;
  String languagePairId;
  String description;
  bool isOnboarding;
  LanguagePair? languagePair;
  bool isPublished;
  bool isLocked;
  int? order;
  Course? course;
  double progress;
  Offer? offer;
  String? offerId;
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
      this.order,
      this.course,
      required this.progress,
      this.offer,
      this.offerId,
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
