// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/model_base.dart';

import 'product.dart' show Product;

class Plan extends ModelBase {
  String title;
  String description;
  String displayTitle;
  bool isPublished;
  String interval;
  int intervalCount;
  String currency;
  int unitAmount;
  int trialPeriodDays;
  int taxPercent;
  String productId;
  Product product;

  Plan({
    required this.title,
    required this.description,
    required this.displayTitle,
    required this.isPublished,
    required this.interval,
    required this.intervalCount,
    required this.currency,
    required this.unitAmount,
    required this.trialPeriodDays,
    required this.taxPercent,
    required this.productId,
    required this.product,
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
