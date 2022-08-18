// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_image_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimationImageGroupResponse _$AnimationImageGroupResponseFromJson(
        Map<String, dynamic> json) =>
    AnimationImageGroupResponse(
      order: json['order'] as int,
      images: (json['images'] as List<dynamic>)
          .map(
              (e) => AnimationImageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimationImageGroupResponseToJson(
        AnimationImageGroupResponse instance) =>
    <String, dynamic>{
      'order': instance.order,
      'images': instance.images,
    };
