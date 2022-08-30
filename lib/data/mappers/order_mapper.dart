import 'package:speakyfox/data/dtos/order_dto.dart';
import 'package:speakyfox/domain/models/order.dart';

extension OrderMapper on OrderDto {
  Order toOrder() {
    return Order(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        copy: copy,
        subscriptionId: subscriptionId,
        effectiveFromUtc: effectiveFromUtc,
        effectiveToUtc: effectiveToUtc,
        paymentMethod: paymentMethod,
        voucherCode: voucherCode,
        priceWithoutVAT: priceWithoutVAT,
        finalPriceWithVAT: finalPriceWithVAT,
        vat: vat,
        userId: userId,
        externalIdentifier: externalIdentifier);
  }
}

extension OrderDtoMapper on Order {
  OrderDto toOrderDto() {
    return OrderDto(
        id: id ??"",
        modified: modified ??"",
        modifiedBy: modifiedBy ??"",
        created: created ??"",
        createdBy: createdBy ??"",
        deleted: deleted ??"",
        deletedBy: deletedBy ??"",
        copy: copy,
        subscriptionId: subscriptionId,
        effectiveFromUtc: effectiveFromUtc,
        effectiveToUtc: effectiveToUtc,
        paymentMethod: paymentMethod,
        voucherCode: voucherCode,
        priceWithoutVAT: priceWithoutVAT,
        finalPriceWithVAT: finalPriceWithVAT,
        vat: vat,
        userId: userId,
        externalIdentifier: externalIdentifier);
  }
}
