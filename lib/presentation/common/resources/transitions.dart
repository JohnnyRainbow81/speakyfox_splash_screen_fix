import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:speakyfox/presentation/common/routing.dart';

CustomTransitionPage buildPageWithSlideTransition({
  required TransitionDirection direction,
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    transitionDuration: const Duration(milliseconds: 300),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Offset begin, end;

      switch (direction) {
        case TransitionDirection.up:
          begin = const Offset(0, -0.5);
          end = Offset.zero;
          break;
        case TransitionDirection.down:
          begin = const Offset(0, 0.5);
          end = Offset.zero;
          break;
        case TransitionDirection.left:
          begin = const Offset(-1, 0);
          end = Offset.zero;
          break;
        case TransitionDirection.right:
          begin = const Offset(1, 0);
          end = Offset.zero;
          break;
      }
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

CustomTransitionPage buildPageWithScaleTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context, animation, secondaryAnimation, child) { 
      var tween = Tween<double>(begin: 0.8, end: 1.0);
      var curvedTween = CurveTween(curve: Curves.elasticOut);
      curvedTween.chain(tween);
      return ScaleTransition(alignment: Alignment.center, scale: curvedTween.animate(animation), child: child);
    },
  );
}