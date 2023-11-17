import 'package:flutter/material.dart';

import '../../core/helpers/animations/animation_class.dart';
import '../../core/helpers/navigator_helper.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/ui_scales.dart';
import 'base_button.dart';
import 'blurred_widget.dart';
import 'custom_text.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    required this.title,
    this.loading = false,
    this.onTap,
    super.key,
  });

  final String title;
  final Function()? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          BlurredWidget(
            onTap: () => NavigatorHelper.pop(),
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
                        CustomText.bold(
                          title,
                          fontSize: 25.0,
                          color: Colors.black,
                          maxLines: 3,
                        ),
                        const SizedBox(height: UIScales.paddingValue * 2,),
                        Row(
                          children: [
                            Expanded(
                              child: BaseButton(
                                buttonText: 'Yes',
                                isOutLine: true,
                                loading: loading,
                                borderColor: AppColors.red,
                                textColor: AppColors.red,
                                onTap: onTap,
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Expanded(
                              child: BaseButton(
                                buttonText: 'No',
                                onTap: () => NavigatorHelper.pop(),
                              ),
                            ),
                          ],
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
    );
  }
}
