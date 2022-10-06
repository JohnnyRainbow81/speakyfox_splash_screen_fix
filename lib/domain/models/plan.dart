// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/model_base.dart';

import 'product.dart' show Product;

class Plan extends ModelBase {
  String title;
  String description;
  String displayTitle;
  bool? isPublished;
  String? interval;
  int intervalCount;
  String currency;
  int unitAmount;
  int trialPeriodDays;
  double taxPercent;
  String productId;
  Product? product;

  Plan({
    required this.title,
    required this.description,
    required this.displayTitle,
    this.isPublished,
    this.interval,
    required this.intervalCount,
    required this.currency,
    required this.unitAmount,
    required this.trialPeriodDays,
    required this.taxPercent,
    required this.productId,
    this.product,
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

  @override
  String toString() {
    return 'Plan(title: $title, description: $description, displayTitle: $displayTitle, isPublished: $isPublished, interval: $interval, intervalCount: $intervalCount, currency: $currency, unitAmount: $unitAmount, trialPeriodDays: $trialPeriodDays, taxPercent: $taxPercent, productId: $productId, product: $product)';
  }
}
