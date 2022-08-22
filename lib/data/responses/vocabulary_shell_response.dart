// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/vocabulary_response.dart';

part 'vocabulary_shell_response.g.dart';

@JsonSerializable()
class VocabularyShellResponse extends BaseResponse {
  String title;
  String description;
  List<VocabularyResponse> vocabularies;

  VocabularyShellResponse({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.title,
    required this.description,
    required this.vocabularies,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory VocabularyShellResponse.fromJson(Map<String, dynamic> json) => _$VocabularyShellResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VocabularyShellResponseToJson(this);
}
