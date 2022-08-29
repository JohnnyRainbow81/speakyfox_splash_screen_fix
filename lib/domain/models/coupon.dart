import 'package:speakyfox/domain/models/model_base.dart';

class Coupon extends ModelBase {
  String key;
  String name;
  int amountOff;
  int percentOff;
  String planId;
  String duration;
  int durationInMonths;

  Coupon(
      {required String id,
      required String modified,
      required String modifiedBy,
      required String created,
      required String createdBy,
      required String deleted,
      required String deletedBy,
      required this.key,
      required this.name,
      required this.amountOff,
      required this.percentOff,
      required this.planId,
      required this.duration,
      required this.durationInMonths})
      : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
