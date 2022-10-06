// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/domain/models/model_base.dart';

import 'plan.dart' show Plan;

class Product extends ModelBase {
  List<Plan> plans = [];

  Product({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.plans,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);

  @override
  String toString() => 'Product(plans: $plans)';
}

enum Vendor {
  @JsonValue("appleStore")
  appleStore,
  @JsonValue("paypal")
  payPal,
  @JsonValue("googleStore")
  googleStore
}
