import 'package:flutter/material.dart';

import '../../core/helpers/animations/animation_class.dart';
import '../../core/themes/ui_scales.dart';
import 'blurred_widget.dart';
import 'custom_text.dart';

class InformDialog extends StatelessWidget {
  const InformDialog({
    required this.title,
    required this.lottie,
    this.onTap,
    super.key,
  });

  final String title;
  final Function()? onTap;
  final String lottie;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onTap != null) {
          onTap!();
          return false;
        }
        return true;
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            BlurredWidget(
              onTap: onTap,
            ),
            MyAnimation(
              animationDirection: AnimationDirection.bottom,
              child: IntrinsicHeight(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(
                    UIScales.paddingValue,
                  ),
                  padding: const EdgeInsets.all(
                    UIScales.paddingValue,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: CustomText.bold(
                              title,
                              fontSize: 25.0,
                              color: Colors.black,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
