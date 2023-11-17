import 'package:flutter/material.dart';

class Assets {
  static const String logo = 'assets/images/logo.png';
  static const String logoQr = 'assets/images/logo-qr.jpg';
  static const String loginImage = 'assets/images/login-image.png';
  static const String otpImage = 'assets/images/otp.png';
  static const String forgetPasswordImage = 'assets/images/forgot-password.png';
  static const String welcomeScreenImage = 'assets/images/welcome-screen.png';

  /// Icons
  static const String homeActiveIcon = 'assets/icons/home-active.png';
  static const String homeInactiveIcon = 'assets/icons/home-inactive.png';
  static const String notificationActiveIcon = 'assets/icons/notification-active.png';
  static const String notificationInactiveIcon = 'assets/icons/notification-inactive.png';
  static const String analyticsActiveIcon = 'assets/icons/analytics-active.png';
  static const String analyticsInactiveIcon = 'assets/icons/analytics-inactive.png';
  static const String settingsActiveIcon = 'assets/icons/settings-active.png';
  static const String settingsInactiveIcon = 'assets/icons/settings-inactive.png';
  static const String facebook = 'assets/icons/social-facebook.png';
  static const String twitter = 'assets/icons/social-twitter.png';
  static const String whatsapp = 'assets/icons/social-whatsapp.png';
  static const String tellMe = 'assets/images/tell-me.png';
  static const String stamp = 'assets/images/stamp.png';
  static const String congrats = 'assets/images/congratulations.png';

  /// Lotties
  static const String done = 'assets/lotties/done.json';
  static const String confetti = 'assets/lotties/confetti.json';
}

Future<void> myPrecacheImage(BuildContext context) async {
  await Future.wait([
    precacheImage(const AssetImage(Assets.logo), context),
    precacheImage(const AssetImage(Assets.logoQr), context),
    precacheImage(const AssetImage(Assets.loginImage), context),
    precacheImage(const AssetImage(Assets.otpImage), context),
    precacheImage(const AssetImage(Assets.forgetPasswordImage), context),
    precacheImage(const AssetImage(Assets.welcomeScreenImage), context),
    precacheImage(const AssetImage(Assets.tellMe), context),
    precacheImage(const AssetImage(Assets.congrats), context),
  ]);
}
