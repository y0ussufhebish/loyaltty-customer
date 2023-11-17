import 'package:flutter/material.dart';

import '../../core/helpers/animations/animation_class.dart';
import '../../core/themes/ui_scales.dart';
import 'blurred_widget.dart';
import 'custom_text.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    required this.title,
    required this.body,
    this.onTap,
    super.key,
  });

  final String title;
  final String body;
  final Function()? onTap;

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                            width: double.infinity,
                          ),
                          CustomText.bold(
                            title,
                            fontSize: 21.0,
                            color: Colors.black,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomText.regular(
                            body,
                            fontSize: 14.0,
                            color: const Color(0xff08081D).withOpacity(0.73),
                            maxLines: 50,
                            height: 1.5,
                            textAlign: TextAlign.start,
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
