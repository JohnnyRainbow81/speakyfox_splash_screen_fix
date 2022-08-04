import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starterkit/presentation/common/widgets/loading_animation.dart';

class RoundImage extends StatelessWidget {
  final String imageUrl;
  final double? size;

  const RoundImage(
    this.imageUrl, {
    this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          height: size ?? 64,
          width: size ?? 64,
          placeholder: (context, url) => const LoadingAnimation(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
