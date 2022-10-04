// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ModelBase {
  String id;
  String? modified;
  String? modifiedBy;
  String? created;
  String? createdBy;
  String? deleted;
  String? deletedBy;

  ModelBase({
    required this.id,
    required this.modified,
    required this.modifiedBy,
    required this.created,
    required this.createdBy,
    required this.deleted,
    required this.deletedBy,
  });
}
