import 'package:flutter/material.dart';
import 'video_swipe_overlay.dart';
import 'package:video_player/video_player.dart';
import '../../common/widgets/actions_toolbar.dart';
import 'video_description.dart';
import 'video_playable.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen(
    this.videoPlayable, {
    Key? key,
  }) : super(key: key);

  final VideoPlayable videoPlayable;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
            child: videoPlayable.controller != null
                ? VideoPlayer(videoPlayable.controller!)
                : const Center(child: Text("No video data"))),
        //Gradient for readability
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                VideoDescription(
                    videoPlayable.video.distance,
                    videoPlayable.video.isOpen,
                    videoPlayable.video.title,
                    videoPlayable.video.shortDescription,
                    videoPlayable.video.hashTags,
                    videoPlayable.video.userImage,
                    videoPlayable.video.userName,
                    videoPlayable.video.userRatingAmount),
                ActionsToolbar(videoPlayable.video.likes, videoPlayable.video.forwards)
              ],
            ),
            const SizedBox(height: 20)
          ],
        ),
        const VideoSwipeOverlay(),
      ],
    );
  }
}
