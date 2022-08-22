import 'package:speakyfox/domain/models/base_model.dart';

class Coupon extends BaseModel {
  String key;
  String name;
  int amountOff;
  int percentOff;
  String planId;
  String duration;
  int durationInMonths;

  Coupon(
      {required String id,
      String? modified,
      String? modifiedBy,
      String? created,
      String? createdBy,
      String? deleted,
      String? deletedBy,
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
