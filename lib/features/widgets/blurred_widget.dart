import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/helpers/navigator_helper.dart';

class BlurredWidget extends StatefulWidget {
  const BlurredWidget({
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<BlurredWidget> createState() => _BlurredWidgetState();
}

class _BlurredWidgetState extends State<BlurredWidget> with TickerProviderStateMixin {

  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller!);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    controller!.forward();

    return InkWell(
      onTap: () {
        if(widget.onTap != null){
          controller!.reverse();
          widget.onTap!();
          return;
        }
        controller!.reverse();
        NavigatorHelper.mayPop();
      },
      child: AnimatedBuilder(
        animation: controller!,
        builder: (BuildContext context, Widget? child) => Opacity(
          opacity: animation!.value,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Container(
              constraints: const BoxConstraints.expand(),
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
