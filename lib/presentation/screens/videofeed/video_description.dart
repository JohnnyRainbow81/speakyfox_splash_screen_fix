import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/loading_animation.dart';

class VideoDescription extends StatelessWidget {
  final distance;
  final isOpen;
  final title;
  final shortDescription;
  final List<String> hashTags;
  final userImage;
  final userName;
  final userRatingAmount;

  const VideoDescription(this.distance, this.isOpen, this.title, this.shortDescription, this.hashTags, this.userImage,
      this.userName, this.userRatingAmount);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: [
              Image.asset('assets/images/distance.png', height: 16),
              const SizedBox(width: 8),
              Text(distance, style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(width: 24),
              Image.asset('assets/images/opening.png', height: 17),
              const SizedBox(width: 8),
              Text(isOpen ? "Offen" : "Geschlossen", style: Theme.of(context).textTheme.bodyText1),
            ]),
            const SizedBox(height: 14),
            Text(title, style: Theme.of(context).textTheme.headline6),
            const SizedBox(
              height: 2,
            ),
            Text(shortDescription, style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(
              height: 8,
            ),
            Row( mainAxisSize: MainAxisSize.max, children: getHashtags(context, hashTags)),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: userImage,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  width: 36,
                  placeholder: (context, url) => const LoadingAnimation(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName, style: Theme.of(context).textTheme.caption
                        //style: const TextStyle(fontSize: 13, color: Colors.white, fontFamily: 'SourceSansProBold'),
                        ),
                    Row(
                      children: [
                        Image.asset('assets/images/star.png', height: 12),
                        const SizedBox(width: 4),
                        Image.asset('assets/images/star.png', height: 12),
                        const SizedBox(width: 4),
                        Image.asset('assets/images/star.png', height: 12),
                        const SizedBox(width: 4),
                        Image.asset('assets/images/star.png', height: 12),
                        const SizedBox(width: 4),
                        Image.asset('assets/images/star.png', height: 12),
                        const SizedBox(width: 6),
                        Text(
                          userRatingAmount,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getHashtags(BuildContext context, List<String> hashTags) {
    List<Widget> widgets = [];

    for (var i = 0; i < hashTags.length; i++) {
      widgets.add(
        Flexible(fit: FlexFit.loose, child: Text("#${hashTags[i]}",maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subtitle2)),
      );

      if (i != hashTags.length - 1) {
        widgets.add(const SizedBox(
          width: 4,
        ));
      }
    }

    return widgets;
  }
}
