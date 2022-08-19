import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/responses/animation_image_response.dart';
import 'package:speakyfox/domain/models/animation_image.dart';

extension AnimationImageMapper on AnimationImageResponse {
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
