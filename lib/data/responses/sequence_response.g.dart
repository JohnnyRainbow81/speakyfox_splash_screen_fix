// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sequence_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SequenceResponse _$SequenceResponseFromJson(Map<String, dynamic> json) =>
    SequenceResponse(
      title: json['title'] as String,
      description: json['description'] as String,
      progressType: $enumDecode(_$ProgressTypeEnumMap, json['progressType']),
      games: (json['games'] as List<dynamic>)
          .map((e) => GameResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      parent: LectureResponse.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SequenceResponseToJson(SequenceResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'progressType': _$ProgressTypeEnumMap[instance.progressType]!,
      'games': instance.games,
      'parent': instance.parent,
    };

const _$ProgressTypeEnumMap = {
  ProgressType.single: 'single',
  ProgressType.whole: 'whole',
};
