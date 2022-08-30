import 'package:speakyfox/data/mappers/animation_image_mapper.dart';
import 'package:speakyfox/data/dtos/animation_image_group_dto.dart';
import 'package:speakyfox/domain/models/animation_image_group.dart';

extension AnimationImageGroupMapper on AnimationImageGroupDto {
  AnimationImageGroup toAnimationImageGroup() {
    return AnimationImageGroup(
        order: order, images: images.map((animationImage) => animationImage.toAnimationImage()).toList());
  }
}

extension AnimationImageGroupDtoMapper on AnimationImageGroup {
  AnimationImageGroupDto toAnimationImageGroupDto() {
    return AnimationImageGroupDto(order: order, images: images.map((e) => e.toAnimationImageDto()).toList());
  }
}
