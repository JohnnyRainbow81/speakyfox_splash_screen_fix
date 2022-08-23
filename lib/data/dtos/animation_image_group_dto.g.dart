// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_image_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimationImageGroupDto _$AnimationImageGroupDtoFromJson(
        Map<String, dynamic> json) =>
    AnimationImageGroupDto(
      order: json['order'] as int,
      images: (json['images'] as List<dynamic>)
          .map((e) => AnimationImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimationImageGroupDtoToJson(
        AnimationImageGroupDto instance) =>
    <String, dynamic>{
      'order': instance.order,
      'images': instance.images,
    };
