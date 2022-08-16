// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/base_model.dart';

import 'plan.dart' show Plan;

class Product extends BaseModel {
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
}

enum Vendor { AppleStore, PayPal, GoogleStore }
