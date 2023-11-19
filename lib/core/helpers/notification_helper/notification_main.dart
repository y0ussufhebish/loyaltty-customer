part of notification_helper;

class NotificationHelper {
  /// Initializing notification helper
  static init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await AwesomeInitialize.initAwesome();
    UserData.deviceToken = (await FirebaseMessaging.instance.getToken())!;
    MyPrint.notePrint('DEVICE TOKEN : ${UserData.deviceToken}');
    MyPrint.notePrint('NOTIFICATIONS SERVICES INITIALIZED !!!');
  }

  /// initializing launching the notification
  static onInit() {
    AwesomeOnInit.onInitAwesome();
    MyPrint.notePrint('NOTIFICATIONS SERVICES ACTION HANDLING STARTED !!!');

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        MyPrint.notePrint('onMessage: ${message.data}');
        try {
          notificationAction(message)[message.data['type']]();
        } catch (_) {}
        AwesomeNotification.awesomeNotificationBuilder(
          title: (message.notification!.title) ?? '',
          body: (message.notification!.body) ?? '',
          payload: message.data,
          foreground: true,
        );
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) async {
        MyPrint.notePrint('onLaunch: ${message.data}');
        notificationTap(message)[message.data['type']]();
      },
    );

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) async {
        if (message != null) {
          notificationTap(message)[message.data['type']]();
        }
      },
    );

    FirebaseMessaging.onBackgroundMessage(_fireBaseBackgroundHandler);
  }
}
