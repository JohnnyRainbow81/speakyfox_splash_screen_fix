import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'loading_animation.dart';

import 'creator_modalbottomsheet.dart';

class ActionsToolbar extends StatelessWidget {
  // Full dimensions of an action
  static const double ActionWidgetSize = 60.0;

// The size of the icon showen for Social Actions
  static const double ActionIconSize = 35.0;

// The size of the share social icon
  static const double ShareActionIconSize = 25.0;

// The size of the profile image in the follow Action
  static const double ProfileImageSize = 50.0;

// The size of the plus icon under the profile image in follow action
  static const double PlusIconSize = 20.0;

  final String likes;
  final String forwards;

  const ActionsToolbar(this.likes, this.forwards);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
            child: Column(
              children: [
                Image.asset('assets/images/star.png', height: 22),
                const SizedBox(height: 28),
                Image.asset('assets/images/heart.png', height: 20),
                const SizedBox(height: 4),
                Text(
                  likes,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Image.asset('assets/images/forward.png', height: 18),
                const SizedBox(height: 4),
                Text(
                  forwards,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
            child: OutlinedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 0)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: MaterialStateProperty.all<BorderSide>(const BorderSide(width: 0, color: Colors.transparent)),
                  minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(18)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blue.withOpacity(0.04);
                      }
                      if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.12);
                      }
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () {
                  _showModalBottomSheet(context);
                },
                child: const Text(
                  'Creator unterstützen',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'SourceSansProBold',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(181, 221, 218, 1),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _getSocialAction({required String title, required IconData icon, bool isShare = false}) {
    return Container(
        margin: const EdgeInsets.only(top: 15.0),
        width: 60.0,
        height: 60.0,
        child: Column(children: [
          Icon(icon, size: isShare ? 25.0 : 35.0, color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 8.0 : 8.0),
            child: Text(title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: isShare ? 14.0 : 14.0)),
          )
        ]));
  }

  Widget _getFollowAction({required String pictureUrl}) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: 60.0,
        height: 60.0,
        child: Stack(children: [_getProfilePicture(pictureUrl), _getPlusIcon()]));
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
      child: Container(
          width: PlusIconSize, // PlusIconSize = 20.0;
          height: PlusIconSize, // PlusIconSize = 20.0;
          decoration:
              BoxDecoration(color: const Color.fromARGB(255, 255, 43, 84), borderRadius: BorderRadius.circular(15.0)),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20.0,
          )),
    );
  }

  Widget _getProfilePicture(userPic) {
    return Positioned(
        left: (ActionWidgetSize / 2) - (ProfileImageSize / 2),
        child: Container(
            padding: const EdgeInsets.all(1.0), // Add 1.0 point padding to create border
            height: ProfileImageSize, // ProfileImageSize = 50.0;
            width: ProfileImageSize, // ProfileImageSize = 50.0;
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
            // import 'package:cached_network_image/cached_network_image.dart'; at the top to use CachedNetworkImage
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10000.0),
                child: CachedNetworkImage(
                  imageUrl: userPic,
                  placeholder: (context, url) => const LoadingAnimation(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ))));
  }

  LinearGradient get musicGradient => LinearGradient(
      colors: [Colors.grey[800]!, Colors.grey[900]!, Colors.grey[900]!, Colors.grey[800]!],
      stops: const [0.0, 0.4, 0.6, 1.0],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);

  Widget _getMusicPlayerAction(userPic) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: ActionWidgetSize,
        height: ActionWidgetSize,
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(11.0),
              height: ProfileImageSize,
              width: ProfileImageSize,
              decoration:
                  BoxDecoration(gradient: musicGradient, borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10000.0),
                  child: CachedNetworkImage(
                    imageUrl: userPic,
                    placeholder: (context, url) => const LoadingAnimation(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ))),
        ]));
  }

  _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.grey.shade100,
        builder: (context) {
          return const CreatorModalBottomSheet();
        });
  }

  /*    Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 0)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(
                              width: 0, color: Colors.transparent)),
                      minimumSize: MaterialStateProperty.all<Size>(
                          const Size.fromHeight(18)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.close, color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        );
      },
    ); 
  }*/
}
