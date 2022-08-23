import 'package:speakyfox/domain/models/base_model.dart';

import "User.dart" show User;
import 'permission.dart' show Permission;

class Group extends BaseModel {
  String name;
  String description;
  String identifier;
  List<User> users = [];
  List<Permission> permissions = [];

  Group(
      {required String id,
      required String modified,
      required String modifiedBy,
      required String created,
      required String createdBy,
      required String deleted,
      required String deletedBy,
      required this.name,
      required this.description,
      required this.identifier,
      required this.users,
      required this.permissions})
      : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
