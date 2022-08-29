// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/sentence.dart';
import 'package:speakyfox/domain/models/word.dart';

class HighlightedPart extends ModelBase {
  List<Map> metadata = [];
  TermType type;
  List<Word> words = [];

  HighlightedPart({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.metadata,
    required this.type,
    required this.words,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
