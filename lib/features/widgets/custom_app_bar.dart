import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title = '',
    this.drawer = false,
    this.edit = false,
    this.notifications = false,
    this.backgroundColor = Colors.transparent,
    this.actions,
    this.editScreen,
    this.leading,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color backgroundColor;
  final bool drawer;
  final List<Widget>? actions;
  final bool edit;
  final bool notifications;
  final Widget? editScreen;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: CustomText.bold(
          title,
          key: Key(title),
          color: AppColors.black,
          height: 1.5,
        ),
      ),
      centerTitle: false,
      backgroundColor: backgroundColor,
      leadingWidth: 30,
      elevation: 0.0,
      actions: [...?actions, const SizedBox(width: 16)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
