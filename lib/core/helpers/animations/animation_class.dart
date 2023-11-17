import 'package:flutter/material.dart';

/// Class [MyAnimation]:
/// [key]: optional widget key reference
/// [child]: mandatory, widget to animate
/// [duration]: how much time the animation should take
/// [delay]: delay before the animation starts
/// [controller]: optional/mandatory, exposes the animation controller created by Animate_do
/// the controller can be use to repeat, reverse and anything you want, its just an animation controller
class MyAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final AnimationDirection animationDirection;
  final AnimationType type;

  MyAnimation({
    required this.child,
    required this.animationDirection,
    this.duration = const Duration(milliseconds: 1000),
    this.delay = const Duration(milliseconds: 0),
    this.controller,
    this.manualTrigger = false,
    this.animate = true,
    this.type = AnimationType.slide,
    key,
  }) : super(key: key) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError('If you want to use manualTrigger:true, \n\n'
          'Then you must provide the controller property, that is a callback like:\n\n'
          ' ( controller: AnimationController) => yourController = controller \n\n');
    }
  }

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimationState createState() => _MyAnimationState();
}

/// Bounce class State, this is where the magic happens
class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  bool disposed = false;
  late Animation<double> animation;
  late Animation<double> opacity;
  @override
  void dispose() {
    disposed = true;
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    opacity = Tween<double>(begin: 1, end: 1).animate(
        CurvedAnimation(parent: controller!, curve: const Interval(0, 0.65)));

    animation = Tween<double>(begin: widget.animationDirection.from, end: 0)
        .animate(
            CurvedAnimation(parent: controller!, curve: widget.type.curve));

    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        if (!disposed) {
          controller?.forward();
        }
      });
    }

    if (widget.controller is Function) {
      widget.controller!(controller!);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animate && widget.delay.inMilliseconds == 0) {
      controller?.forward();
    }

    return AnimatedBuilder(
        animation: controller!,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: widget.animationDirection.isHorizontal
                  ? Offset(
                      Directionality.of(context).name == 'rtl'
                          ? -animation.value
                          : animation.value,
                      0.0)
                  : Offset(0.0, animation.value),
              child: Opacity(opacity: opacity.value, child: widget.child));
        });
  }
}

/// Type of the animation for the whole class
enum AnimationType {
  bounce(
    curve: Curves.elasticIn,
  ),
  slide(
    curve: Curves.easeInOut,
  );

  final Curve curve;
  const AnimationType({
    required this.curve,
  });
}

/// Direction of the animation for the class
enum AnimationDirection {
  start(
    from: -75.0,
    offset: Offset(0.0, -75.0),
    isHorizontal: true,
  ),
  end(
    from: 75.0,
    offset: Offset(0.0, 75.0),
    isHorizontal: true,
  ),
  top(
    from: -75.0,
    offset: Offset(-75.0, 0.0),
    isHorizontal: false,
  ),
  bottom(
    from: 75.0,
    offset: Offset(75.0, 0.0),
    isHorizontal: false,
  );

  final double from;
  final Offset offset;
  final bool isHorizontal;

  const AnimationDirection({
    required this.from,
    required this.offset,
    required this.isHorizontal,
  });
}
