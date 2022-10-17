// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/models/model_base.dart';

import "course.dart" show Course;
import 'offer.dart' show Offer;
import 'sequence.dart' show Sequence;

class Lecture extends ModelBase {
  String title;
  String description;
  bool isOnboarding;
  LanguagePair? languagePair;
  String? languagePairId;
  bool? isPublished;
  bool isLocked;
  int? order;
  Course? course;
  String? courseId;
  double progress;
  Offer? offer;
  String? offerId;
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

  @override
  String toString() {
    return 'Lecture(title: $title, languagePairId: $languagePairId, description: $description, isOnboarding: $isOnboarding, languagePair: $languagePair, isPublished: $isPublished, isLocked: $isLocked, order: $order, course: $course, progress: $progress, offer: $offer, offerId: $offerId, courseId: $courseId, sequences: $sequences)';
  }
}
