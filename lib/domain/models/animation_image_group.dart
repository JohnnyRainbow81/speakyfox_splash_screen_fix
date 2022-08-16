// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/animation_image.dart';

class AnimationImageGroup {
  num order;
  List<AnimationImage> images = [];
  AnimationImageGroup({
    required this.order,
    required this.images,
  });
}
