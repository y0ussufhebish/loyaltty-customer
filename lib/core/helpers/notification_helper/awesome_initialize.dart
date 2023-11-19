part of notification_helper;

class AwesomeInitialize {
  static Future initAwesome() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/icon',
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: AppColors.baseColor,
          ledColor: Colors.white,
          enableVibration: true,
          playSound: true,
          enableLights: true,
          importance: NotificationImportance.High,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group',
        ),
      ],
      debug: true,
    );
  }
}
