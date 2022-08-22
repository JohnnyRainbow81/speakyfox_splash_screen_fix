// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/dtos/image_dto.dart';

part 'animation_image_dto.g.dart';

@JsonSerializable()
class AnimationImageDto {
  int order;
  dynamic nativeElement;
  ImageDto image;
  String url;
  String animationClass;
  bool fromLeft = true;
  bool isVisible = false;

  AnimationImageDto({
    required this.order,
    required this.nativeElement,
    required this.image,
    required this.url,
    required this.animationClass,
    required this.fromLeft,
    required this.isVisible,
  });

  factory AnimationImageDto.fromJson(Map<String, dynamic> json) => _$AnimationImageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AnimationImageDtoToJson(this);
}
