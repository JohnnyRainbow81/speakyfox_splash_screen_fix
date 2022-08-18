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
    required this.metadata,
    required String id,
    required this.type,
    required this.words,
  }) : super(id: id);

  factory HighlightedPartResponse.fromJson(Map<String, dynamic> json) => _$HighlightedPartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HighlightedPartResponseToJson(this);
}
