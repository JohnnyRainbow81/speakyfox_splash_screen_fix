// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/word_response.dart';

import '../../domain/models/sentence.dart';

part 'highlighted_part_response.g.dart';

@JsonSerializable()
class HighlightedPartResponse extends BaseResponse {
  List<Map> metadata;
  TermType type;
  List<WordResponse> words;

  HighlightedPartResponse({
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
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory HighlightedPartResponse.fromJson(Map<String, dynamic> json) => _$HighlightedPartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HighlightedPartResponseToJson(this);
}
