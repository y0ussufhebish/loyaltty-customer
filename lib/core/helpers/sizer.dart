import 'package:flutter/material.dart';

import 'navigator_helper.dart';

class SizerHelper {
  /// Returns the percentage of the screen width
  static double w(double percent) {
    return MediaQuery.of(NavigatorHelper.context).size.width *
        (percent / 100.0);
  }

  /// Returns the percentage of the screen height
  static double h(double percent) {
    return MediaQuery.of(NavigatorHelper.context).size.height *
        (percent / 100.0);
  }
}
