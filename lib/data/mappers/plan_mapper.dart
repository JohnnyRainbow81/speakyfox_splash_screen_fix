import 'package:speakyfox/data/mappers/product_mapper.dart';
import 'package:speakyfox/data/responses/plan_response.dart';
import 'package:speakyfox/domain/models/plan.dart';

extension PlanMapper on PlanResponse {
  Plan toPlan() {
    return Plan(
        title: title,
        description: description,
        displayTitle: displayTitle,
        isPublished: isPublished,
        interval: interval,
        intervalCount: intervalCount,
        currency: currency,
        unitAmount: unitAmount,
        trialPeriodDays: trialPeriodDays,
        taxPercent: taxPercent,
        productId: productId,
        product: product.toProduct(),
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "");
  }
}
