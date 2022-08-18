// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerResponse _$AnswerResponseFromJson(Map<String, dynamic> json) =>
    AnswerResponse(
      title: json['title'] as String,
      isCorrect: json['isCorrect'] as bool,
    );

Map<String, dynamic> _$AnswerResponseToJson(AnswerResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isCorrect': instance.isCorrect,
    };
