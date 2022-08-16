// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/base_model.dart';

import 'sentence.dart' show Sentence;

class SentenceShell extends BaseModel {
  String title;
  String description;
  List<Sentence> sentences = [];
  
  SentenceShell({
     required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.title,
    required this.description,
    required this.sentences,

  }): super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
