import '../../../domain/models/video.dart';
import 'package:video_player/video_player.dart';

//'Intermediate' class for bringing together the Video model(>only light video meta data) 
//and presentation layer functionalities(>VideoPlayerController with heavy video pixel data, controlled by VideoFeedViewModel)

//The class is initialised/cached/disposed in the VideoFeedViewModel

//VideoFeedViewModel generally handles all instances of VideoPlayable and feeds the VideoFeedPager 
//with the currently needed VideoPlayable (+ caches VideoPlayables in advance for better performance)
class VideoPlayable {
  Video video; //light model data
  VideoPlayerController? controller; //carries heavy pixel data, controlled by VideoFeedViewModel
  bool loaded = false;

  VideoPlayable(this.video);

//Called by VideoFeedViewModel for caching logic
  Future<void> loadController() async {
    //TODO delete fake- if/then clause
    
      controller = VideoPlayerController.network(video.url);
    
    controller?.setLooping(true);
    controller?.setVolume(0);
    //If the asset isn't valid, the app crashes silently on iOS. No error/exceptions messages :/
    //I made a posting on StackOverflow:
    //https://stackoverflow.com/questions/72964987/how-to-catch-platform-native-errors-in-flutter-and-prevent-crashing
    return controller
        ?.initialize()
        //no effect if asset isn't valid
        .catchError((onError) =>
            throw Exception("catchError: VideoPlayerController couldn't get initialized. Maybe error with video data?"))
        //also no effect
        .onError((error, stackTrace) =>
            throw Exception("onError: VideoPlayerController couldn't get initialized. Maybe error with video data?"));
  }
}
