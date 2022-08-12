import 'package:flutter/material.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';
import 'package:speakyfox/presentation/common/widgets/circle_image_animation.dart';
import 'package:speakyfox/presentation/common/widgets/divider_widget.dart';
import 'package:speakyfox/presentation/common/widgets/keywords_widget.dart';
import 'package:speakyfox/presentation/common/widgets/list_tile_widget.dart';
import 'package:speakyfox/presentation/common/widgets/loading_animation.dart';
import 'package:speakyfox/presentation/common/widgets/rating_widget.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: AppBar( ),
        body: Center(
          child: SingleChildScrollView(padding: EdgeInsets.all(8),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Headln 1",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        "Headline 2",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "Headline 3",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        "Headline 4",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        "Headline 5",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        "Headline 6",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "These are some lines of [bodyText1]. You can see and judge if size, lineheight etc match to your preferences. If not, change it in the [Themes] class.",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "These are some lines of [bodyText2]. You can see and judge if size, lineheight etc match to your preferences. If not, change it in the [Themes] class.",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "This Text has no TextStyle applied (defaults to bodyText2)",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Wrap(spacing: 4,runSpacing: 4, children: const [
                        ColorTest(ColorAssets.primary, "primary"),
                        ColorTest(ColorAssets.bgBlueDark, "bgBlueDark"),
                        ColorTest(ColorAssets.bgBlueLight, "bgBlueLight"),
                        ColorTest(ColorAssets.headlineBlue, "headlineBlue"),
                        ColorTest(ColorAssets.footerBlue, "footerBlue"),
                        ColorTest(ColorAssets.markupGreen, "markupGreen"),
                        ColorTest(ColorAssets.mediumOrange, "mediumOrange"),
            
                        ColorTest(ColorAssets.lightGrey, "lightGrey"),
                        ColorTest(ColorAssets.midGrey, "midgGrey"),
                        ColorTest(ColorAssets.copyTextGrey, "copyTextGrey"),
                        ColorTest(ColorAssets.grBluePurpleLight, "grBluePurple", color2: ColorAssets.grBluePurpleDark),
                        ColorTest(
                          ColorAssets.grBlueboxLight,
                          "grBluebox",
                          color2: ColorAssets.grBluePurpleDark,
                        ),
                        ColorTest(ColorAssets.sliderActiveTrack, "sliderActiveTrack"),
                        ColorTest(ColorAssets.sliderInactiveTrack, "sliderInactiveTrack"),
                        ColorTest(ColorAssets.sliderThumbColor, "sliderThumbColor"),
                        //ColorTest(ColorAssets.buttonHoveredColor, "buttonHoveredColor"),
            
                      ]),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "[button]text",
                        style: Theme.of(context).textTheme.button,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "This is a [caption]",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "This is a [subTitle1]",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "This is a [subTitle2]",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const CircleImageAnimation(
                        child: Icon(Icons.alarm),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const KeywordsWidget(["Keywords", "Widget", "Example"]),
                      const SizedBox(
                        height: 16,
                      ),
                      const DividerWidget(),
                      ListTileWidget(text: "This is a ListTileWidget", iconLeading: Icons.timer, action: () {}),
                      const DividerWidget(),
                      const SizedBox(
                        height: 16,
                      ),
                      const LoadingAnimation(),
                      const SizedBox(
                        height: 16,
                      ),
                      const RatingWidget(averageRating: 4.6, ratings: 645),
                      const SizedBox(
                        height: 16,
                      ),
                      /* const RoundImage("https://diggitize.com/wp-content/uploads/2022/04/cropped-favicon_512.png",
                          size: 56) */
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorTest extends StatelessWidget {
  final String colorName;
  final Color color;
  final Color? color2;
  
  const ColorTest(
    this.color,
    this.colorName, {
    this.color2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = 4;
    int colorPerRow = 4;
    double size = screenWidth / colorPerRow - ((colorPerRow - 1) * padding);
    return Column(
      children: [
    color2 == null
        ? Container(
            //padding: const EdgeInsets.all(8),
            height: size,
            width: size,
            color: color,
          )
        : Container(
            //padding: const EdgeInsets.all(8),
            height: size,
            width: size,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
              color,
              color2!,
            ])),
          ),
    SizedBox(width: size - 8, child: Text(colorName,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 10),maxLines: 1,))
      ],
    );
  }
}
