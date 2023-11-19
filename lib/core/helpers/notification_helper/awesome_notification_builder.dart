part of notification_helper;

class AwesomeNotification {
  static awesomeNotificationBuilder({
    int id = 0,
    String title = '',
    String body = '',
    Map<String, dynamic>? payload,
    bool foreground = false,
    bool locked = false,
  }) {
    Map<String, String>? data = payload?.map(
      (key, value) => MapEntry(
        key,
        value.toString(),
      ),
    );
    MyPrint.notePrint('NOTIFICATION DATA : $data');
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        summary: '$foreground',
        title: title,
        body: body,
        payload: data,
        locked: locked,
        actionType: ActionType.Default,
      ),
    );
  }
}