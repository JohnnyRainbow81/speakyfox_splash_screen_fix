// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/image_response.dart';

part 'animation_image_response.g.dart';

@JsonSerializable()
class AnimationImageResponse {
  int order;
  dynamic nativeElement;
  ImageResponse image;
  String url;
  String animationClass;
  bool fromLeft = true;
  bool isVisible = false;
  
  AnimationImageResponse({
    required this.order,
    required this.nativeElement,
    required this.image,
    required this.url,
    required this.animationClass,
    required this.fromLeft,
    required this.isVisible,
  });
  

  factory AnimationImageResponse.fromJson(Map<String, dynamic> json) => _$AnimationImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnimationImageResponseToJson(this);
}
