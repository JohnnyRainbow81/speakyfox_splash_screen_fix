// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/image.dart';

class AnimationImage {
  num order;
  dynamic nativeElement;
  Image image;
  String url;
  String animationClass;
  bool fromLeft = true;
  bool isVisible = false;
  
  AnimationImage({
    required this.order,
    required this.nativeElement,
    required this.image,
    required this.url,
    required this.animationClass,
    required this.fromLeft,
    required this.isVisible,
  });
}
