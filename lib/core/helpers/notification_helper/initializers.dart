part of notification_helper;

/// Firebase background handler
Future<void> _fireBaseBackgroundHandler(RemoteMessage message) async {
  try {
    notificationAction(message)[message.data['type']]();
  } catch (e, s) {
    MyPrint.errorPrint('error $e');
    MyPrint.errorPrint('error $s');
  }
  MyPrint.notePrint('${message.data}');
}
