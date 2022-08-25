// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class BaseModel {
  String? id;
  String? modified;
  String? modifiedBy;
  String? created;
  String? createdBy;
  String? deleted;
  String? deletedBy;

  BaseModel({
    required this.id,
    required this.modified,
    required this.modifiedBy,
    required this.created,
    required this.createdBy,
    required this.deleted,
    required this.deletedBy,
  });

  @override
  String toString() {
    return 'BaseModel(id: $id, modified: $modified, modifiedBy: $modifiedBy, created: $created, createdBy: $createdBy, deleted: $deleted, deletedBy: $deletedBy)';
  }
}
