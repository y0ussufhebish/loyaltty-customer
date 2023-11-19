part of notification_helper;

class AwesomeOnInit{
  static onInitAwesome(){
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: AwesomeController.onActionReceivedMethod,
      onNotificationCreatedMethod: AwesomeController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: AwesomeController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: AwesomeController.onDismissActionReceivedMethod,
    );
  }
}