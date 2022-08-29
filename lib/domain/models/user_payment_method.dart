// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/payment_method.dart';

abstract class UserPaymentMethod extends ModelBase {
  PaymentMethodType type;

  String externalId;

  UserPaymentMethod(
      {required String id,
      required String modified,
      required String modifiedBy,
      required String created,
      required String createdBy,
      required String deleted,
      required String deletedBy,
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
