// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/model_base.dart';

import 'vocabulary.dart' show Vocabulary;

class VocabularyShell extends ModelBase {
  String title;
  String description;
  List<Vocabulary> vocabularies = [];

  VocabularyShell(
      {required String id,
      required String modified,
      required String modifiedBy,
      required String created,
      required String createdBy,
      required String deleted,
      required String deletedBy,
      required this.title,
      required this.description,
      required this.vocabularies})
      : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
