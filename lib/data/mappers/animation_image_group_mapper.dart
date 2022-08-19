import 'package:speakyfox/data/mappers/animation_image_mapper.dart';
import 'package:speakyfox/data/responses/animation_image_group_response.dart';
import 'package:speakyfox/domain/models/animation_image_group.dart';

extension AnimationImageGroupMapper on AnimationImageGroupResponse {
  AnimationImageGroup toAnimationImageGroup() {
    return AnimationImageGroup(
        order: order, images: images.map((animationImage) => animationImage.toAnimationImage()).toList());
  }
}
