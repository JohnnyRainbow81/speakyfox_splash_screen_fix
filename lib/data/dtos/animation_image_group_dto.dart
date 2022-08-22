// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/animation_image_dto.dart';

part 'animation_image_group_dto.g.dart';

@JsonSerializable()
class AnimationImageGroupDto {
  int order;
  List<AnimationImageDto> images;

  AnimationImageGroupDto({
    required this.order,
    required this.images,
  });

  factory AnimationImageGroupDto.fromJson(Map<String, dynamic> json) => _$AnimationImageGroupDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AnimationImageGroupDtoToJson(this);
}
