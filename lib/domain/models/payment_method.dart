// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/base_model.dart';

import 'image.dart';

enum PaymentProvider { AppleStore, PayPal, GooglePlayStore, Stripe, Speakyfox }
enum PaymentMethodType {
  SEPADirectDebit,
  CreditCard,
  PayPal,
  AppleId,
  Internal
}

class PaymentMethod extends BaseModel {
  String name;
  String description;
  String additionalInformation;
  String fileName;
  String fileId;
  Image image;
  PaymentProvider paymentProvider;
  PaymentMethodType type;
  String externalId;
  PaymentMethod({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.name,
    required this.description,
    required this.additionalInformation,
    required this.fileName,
    required this.fileId,
    required this.image,
    required this.paymentProvider,
    required this.type,
    required this.externalId,
  }): super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}

