// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';
import 'package:speakyfox/presentation/common/routes.dart';

class OnboardingPager extends StatefulWidget {
  const OnboardingPager({Key? key}) : super(key: key);

  @override
  State<OnboardingPager> createState() => _OnboardingPagerState();
}

class _OnboardingPagerState extends State<OnboardingPager> {
  late List<OnboardingScreenData> _screenDatas;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    //TODO fetch dynamic Onboarding data?
    _screenDatas = [
      OnboardingScreenData(text: "Willkommen bei Speakyfox"),
      OnboardingScreenData(text: "Lerne innerhalb kürzester Zeit eine neue Sprache"),
      OnboardingScreenData(text: "Behalte ganz easy neue Wörter"),
      OnboardingScreenData(text: "Wir wünschen dir viel Vergnügen!")
    ];
    _pageController = PageController();
    _pageController.addListener(_onPageChange);
  }

  void _onPageChange() {
    int previousPage = _currentPage;
    //if page is "half-turned", switch outlined/filled circle
    _currentPage = _pageController.page!.roundToDouble().toInt();
    if (previousPage != _currentPage) {
      debugPrint("Filled progress circle should switch now");
      setState(() {});
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChange);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //double maxPageViewHeight = MediaQuery.of(context).size.height * 0.9;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).copyWith(scaffoldBackgroundColor: ColorAssets.lightest).scaffoldBackgroundColor,
        body: PageView(controller: _pageController, onPageChanged: (value) => _currentPage = value, children: [
          ..._screenDatas.map((e) => _OnboardingScreen(e)).toList(),
        ]),
        bottomSheet: _getProgressWidget(_currentPage),
        //extendBody: false,
      ),
    );
  }

  Widget _getProgressWidget(int current) {
    return Stack( children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < _screenDatas.length; i++)
            if (i == _currentPage) const Circle(filled: true) else const Circle(filled: false)
        ]),
      ),
      Positioned(right: 20, bottom: -2.0,
        child: TextButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.register), child: const Text("Skip")),
      )
    ]);
  }
}

class Circle extends StatelessWidget {
  final bool filled;
  const Circle({required this.filled, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        height: 12,
        width: 12,
        decoration: BoxDecoration(
          color: filled ? ColorAssets.primary : Colors.transparent,
          shape: BoxShape.circle,
          border: filled
              ? Border.all(width: 0, color: ColorAssets.primary)
              : Border.all(width: 2, color: ColorAssets.primary),
        ),
      ),
    );
  }
}

class _OnboardingScreen extends StatelessWidget {
  final OnboardingScreenData screenData;

  const _OnboardingScreen(
    this.screenData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        screenData.imageAsset != null
            ? AspectRatio(aspectRatio: 4 / 5, child: Image.asset(screenData.imageAsset!))
            : const AspectRatio(aspectRatio: 4 / 5, child: Placeholder()),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            screenData.text,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        )
      ],
    );
  }
}

class OnboardingScreenData {
  String? imageAsset;
  String text;

  OnboardingScreenData({
    this.imageAsset,
    required this.text,
  });
}
