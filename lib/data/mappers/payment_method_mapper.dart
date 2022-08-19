import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/responses/payment_method_response.dart';
import 'package:speakyfox/domain/models/payment_method.dart';

extension PaymentMethodMapper on PaymentMethodResponse {
  PaymentMethod toPaymentMethod() {
    return PaymentMethod(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ??"",
        name: name,
        description: description,
        additionalInformation: additionalInformation,
        fileName: fileName,
        fileId: fileId,
        image: image.toImage(),
        paymentProvider: paymentProvider,
        type: type,
        externalId: externalId);
  }
}
