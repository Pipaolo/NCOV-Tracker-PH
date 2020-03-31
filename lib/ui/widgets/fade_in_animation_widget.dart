import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class FadeInAnimationWidget extends StatelessWidget {
  final Widget child;
  final double delay;
  const FadeInAnimationWidget({
    Key key,
    this.child,
    this.delay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween(
      [
        Track("opacity").add(
          Duration(milliseconds: 500),
          Tween(begin: 0.0, end: 1.0),
        ),
        Track('translateX').add(
          Duration(milliseconds: 500),
          Tween(begin: 130.0, end: 0.0),
          curve: Curves.easeOut,
        ),
      ],
    );

    return ControlledAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation['opacity'],
        child: Transform.translate(
          offset: Offset(animation['translateX'], 0),
          child: child,
        ),
      ),
    );
  }
}
