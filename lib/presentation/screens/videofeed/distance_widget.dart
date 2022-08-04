import 'package:flutter/material.dart';
import '../../common/resources/color_assets.dart';

class DistanceWidget extends StatelessWidget {
  final String distance;
  const DistanceWidget(this.distance, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: const EdgeInsets.only(top: 8, left: 16.0, right: 16.0, bottom: 8),
            decoration: const BoxDecoration(
              color: ColorAssets.black54,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Row(mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/distance.png', height: 18),
                const SizedBox(width: 8),
                Text(
                  distance,
                  style: Theme.of(context).textTheme.bodyText1
                ),
              ],
            ),
          ),
      ),
    );
  }
}
