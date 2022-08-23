// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimationImageDto _$AnimationImageDtoFromJson(Map<String, dynamic> json) =>
    AnimationImageDto(
      order: json['order'] as int,
      nativeElement: json['nativeElement'],
      image: ImageDto.fromJson(json['image'] as Map<String, dynamic>),
      url: json['url'] as String,
      animationClass: json['animationClass'] as String,
      fromLeft: json['fromLeft'] as bool,
      isVisible: json['isVisible'] as bool,
    );

Map<String, dynamic> _$AnimationImageDtoToJson(AnimationImageDto instance) =>
    <String, dynamic>{
      'order': instance.order,
      'nativeElement': instance.nativeElement,
      'image': instance.image,
      'url': instance.url,
      'animationClass': instance.animationClass,
      'fromLeft': instance.fromLeft,
      'isVisible': instance.isVisible,
    };
