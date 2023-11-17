import 'package:flutter/material.dart';

class NavigatorHelper {
  static final BuildContext context = navigateKey.currentState!.context;
  static GlobalKey<NavigatorState> navigateKey = GlobalKey<NavigatorState>();

  /// Navigate to a new route and let the old route
  static Future<dynamic> push(Widget page) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  /// Navigate to a new route and finishing the old route
  static Future<dynamic> pushReplacement(Widget page) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false,
      );

  /// GO back method
  static void pop({dynamic object}) => Navigator.pop(context, object);

  /// GO back method
  static void mayPop() => Navigator.maybePop(context);

  /// Restart the app
  static Future<dynamic> restart() =>
      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
}
