import 'package:flutter/material.dart';
import '../../common/resources/color_assets.dart';
import 'videofeed_viewmodel.dart';
import '../../../app/constants.dart';
import '../../../app/dependency_injection.dart';

class VideoSwipeOverlay extends StatefulWidget {
  const VideoSwipeOverlay({Key? key}) : super(key: key);

  @override
  State<VideoSwipeOverlay> createState() => _VideoSwipeOverlayState();
}

class _VideoSwipeOverlayState extends State<VideoSwipeOverlay> {
  bool showOverlay = false;

  @override
  void initState() {
    super.initState();

    //After 1 second, show VideoSwipeOverlay
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => showOverlay = true);
      }
    })
        //Show overlay for[videoSwipeOverlayDuration] seconds
        .then((value) => Future.delayed(const Duration(seconds: Constants.videoSwipeOverlayDuration), () {
              if (mounted) {
                setState(() => showOverlay = false);
              }
            }))
        //After that, make sure it won't show up again next time
        .then((value) => locator<VideoFeedViewModel>().setIsFirstTime = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showOverlay == true && locator<VideoFeedViewModel>().isFirstTime == true ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 600),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.height* 0.4,
          decoration:  BoxDecoration(border: Border.all(width: 20, color: ColorAssets.primary.withOpacity(0.3),),
              borderRadius: const BorderRadius.all(Radius.circular(5000))),
          child: Image.asset(
                  'assets/gifs/swipe-up.gif',height: MediaQuery.of(context).size.height * 2, width: MediaQuery.of(context).size.height * 2,
                ),
        ),
      ),
    );
  }
}
