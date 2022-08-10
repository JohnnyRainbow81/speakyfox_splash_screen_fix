// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class BaseModel {
  String id;
  DateTime modified;
  
  BaseModel({
    required this.id,
    required this.modified,
  });
}
