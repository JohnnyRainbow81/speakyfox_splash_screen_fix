import 'package:speakyfox/data/mappers/plan_mapper.dart';
import 'package:speakyfox/data/responses/product_response.dart';
import 'package:speakyfox/domain/models/product.dart';

extension ProductMapper on ProductResponse {
  Product toProduct() {
    return Product(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        plans: plans.map((plan) => plan.toPlan()).toList() );
  }
}
