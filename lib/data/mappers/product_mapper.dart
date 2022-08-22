import 'package:speakyfox/data/mappers/plan_mapper.dart';
import 'package:speakyfox/data/dtos/product_dto.dart';
import 'package:speakyfox/domain/models/product.dart';

extension ProductMapper on ProductDto {
  Product toProduct() {
    return Product(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        plans: plans.map((plan) => plan.toPlan()).toList());
  }
}
