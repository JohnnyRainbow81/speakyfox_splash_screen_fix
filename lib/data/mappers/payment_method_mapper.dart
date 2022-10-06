import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/dtos/payment_method_dto.dart';
import 'package:speakyfox/domain/models/payment_method.dart';

extension PaymentMethodMapper on PaymentMethodDto {
  PaymentMethod toPaymentMethod() {
    return PaymentMethod(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        name: name ?? "",
        description: description ?? "",
        additionalInformation: additionalInformation,
        fileName: fileName,
        fileId: fileId,
        image: image.toImage(),
        paymentProvider: paymentProvider,
        type: type,
        externalId: externalId);
  }
}
