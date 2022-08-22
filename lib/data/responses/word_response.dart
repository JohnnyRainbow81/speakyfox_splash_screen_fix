// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/vocabulary_shell_response.dart';

import '../../domain/models/sentence.dart';

part 'word_response.g.dart';

@JsonSerializable()
class WordResponse extends BaseResponse {
  int index;
  String entry;
  List<Map> metadata;
  TermType type;
  String vocabularyShellId;
  VocabularyShellResponse vocabularyShell;

  WordResponse({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.index,
    required this.entry,
    required this.metadata,
    required this.type,
    required this.vocabularyShellId,
    required this.vocabularyShell,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory WordResponse.fromJson(Map<String, dynamic> json) => _$WordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WordResponseToJson(this);
}
