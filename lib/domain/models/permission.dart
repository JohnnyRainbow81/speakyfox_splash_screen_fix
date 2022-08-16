// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'group.dart' show Group;

class Permission {
  String name;
  String description;
  String identifier;
  List<Group> groups = [];
  
  Permission({
    required this.name,
    required this.description,
    required this.identifier,
    required this.groups,
  });
}
