// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimationImageResponse _$AnimationImageResponseFromJson(
        Map<String, dynamic> json) =>
    AnimationImageResponse(
      order: json['order'] as int,
      nativeElement: json['nativeElement'],
      image: ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      url: json['url'] as String,
      animationClass: json['animationClass'] as String,
      fromLeft: json['fromLeft'] as bool,
      isVisible: json['isVisible'] as bool,
    );

Map<String, dynamic> _$AnimationImageResponseToJson(
        AnimationImageResponse instance) =>
    <String, dynamic>{
      'order': instance.order,
      'nativeElement': instance.nativeElement,
      'image': instance.image,
      'url': instance.url,
      'animationClass': instance.animationClass,
      'fromLeft': instance.fromLeft,
      'isVisible': instance.isVisible,
    };
