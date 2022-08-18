// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/animation_image_response.dart';

part 'animation_image_group_response.g.dart';

@JsonSerializable()
class AnimationImageGroupResponse {
  int order;
  List<AnimationImageResponse> images;

  AnimationImageGroupResponse({
    required this.order,
    required this.images,
  });

  factory AnimationImageGroupResponse.fromJson(Map<String, dynamic> json) => _$AnimationImageGroupResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnimationImageGroupResponseToJson(this);
}
