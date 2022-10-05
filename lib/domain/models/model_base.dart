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
    this.modified,
    this.modifiedBy,
    this.created,
    this.createdBy,
    this.deleted,
    this.deletedBy,
  });
}
