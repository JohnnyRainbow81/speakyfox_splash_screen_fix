// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/base_model.dart';
import 'package:speakyfox/domain/models/sentence.dart';
import 'package:speakyfox/domain/models/vocabulary_shell.dart';

class Word extends BaseModel {
  int index;
  String entry;
  List<Map> metadata = [];
  TermType type;
  String vocabularyShellId;
  VocabularyShell vocabularyShell;
  
  Word({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.index,
    required this.entry,
    required this.metadata,
    required this.type,
    required this.vocabularyShellId,
    required this.vocabularyShell,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
