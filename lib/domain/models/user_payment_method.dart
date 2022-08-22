// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/base_model.dart';
import 'package:speakyfox/domain/models/payment_method.dart';

abstract class UserPaymentMethod extends BaseModel {
  PaymentMethodType type;

  String externalId;

  UserPaymentMethod(
      {required String id,
      String? modified,
      String? modifiedBy,
      String? created,
      String? createdBy,
      String? deleted,
      String? deletedBy,
      required this.type,
      required this.externalId})
      : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}

