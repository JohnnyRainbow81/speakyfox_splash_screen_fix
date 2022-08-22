import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/dtos/animation_image_dto.dart';
import 'package:speakyfox/domain/models/animation_image.dart';

extension AnimationImageMapper on AnimationImageDto {
  AnimationImage toAnimationImage() {
    return AnimationImage(
        order: order,
        nativeElement: nativeElement,
        image: image.toImage(),
        url: url,
        animationClass: animationClass,
        fromLeft: fromLeft,
        isVisible: isVisible);
  }
}
