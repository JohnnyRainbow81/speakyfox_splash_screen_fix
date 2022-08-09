import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:speakyfox/presentation/common/widgets/errors/common_error_dialog.dart';
import 'package:get_it/get_it.dart';
import '../../../app/locator.dart';
import '../../common/widgets/loading_animation.dart';
import 'package:stacked/stacked.dart';
import 'video_playable.dart';
import 'video_screen.dart';
import 'videofeed_viewmodel.dart';

class VideoFeedPager extends StatefulWidget {
  const VideoFeedPager(this.setCompanyId, {Key? key}) : super(key: key);
  final Function setCompanyId;

  @override
  State<VideoFeedPager> createState() => _VideoFeedPagerState();
}

class _VideoFeedPagerState extends State<VideoFeedPager> {
  final _model = locator<VideoFeedViewModel>();
  late final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      _pageController.addListener(onPageChangeListener);
    }
    //Necessary to call _model.init() AFTER build() has run a first time because
    //otherwise _model.init() would call setState() during build() which is a no go of course.

    //By the way: There is a "onModelReady" parameter in the stacked-library's ViewModel-constructor
    //screaming for being used for initialisation purposes, but it doesn't [await] for
    //the Future so it unfortunately starts the build()-Function with unfinished
    //business that way. This means: The build() function gets interrupted by a setState()-call from the
    //model.init() function, which depends on library code. So sad. I blame the library!
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _model.init();
    });
  }

  void onPageChangeListener() {
    //TODO when Page changes, bottom Gradient should fade out
    //Attention: print statements DO NOT get called here for some reason!
  }

  @override
  void dispose() {
    _pageController.removeListener(onPageChangeListener);
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    _model.play(page);
    widget.setCompanyId(_model.companyId);
  }

  void _retry() {
    _model.retry();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VideoFeedViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => _model,
        initialiseSpecialViewModelsOnce: true,
        //onDispose: (_) => _model.dispose(),
        builder: (ctx, __, ch) {
          if (_model.hasError) {
            //Retry
            SchedulerBinding.instance.addPostFrameCallback((_) => showCommonErrorDialog(
                context: context, exception: _model.modelError, action: _retry, actionText: "Retry"));
          } else if (_model.hasVideos) {
            return AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _model.isVideoReady ? 1.0 : 0,
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _pageController,
                  itemCount: _model.videoCount,
                  key: const PageStorageKey("storageMe"),
                  restorationId: "restoreMe",
                  onPageChanged: (page) async => onPageChanged(page),
                  itemBuilder: (context, page) {
                    VideoPlayable videoPlayable = _model.getVideoPlayableFor(page); //Just json/meta data for video
                    return FutureBuilder(
                      future: _model.loadVideo(page), //The actual heavy video pixel data!
                      builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.done
                          ? (VideoScreen(
                              videoPlayable,
                              key: Key(videoPlayable.video.id),
                            ))
                          : const Center(child: LoadingAnimation()),
                    );
                  }),
            );
          } else if (!_model.hasVideos) {
            return Container();
          } else if (_model.isBusy) {
            return const Center(
              child: LoadingAnimation(),
            );
          } else {
            throw Error();
          }
          return Container();
        });
  }
}
