import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> create_notification(String t, int d) async {
  List time = t.split(":");
  print(DateTime.now().hour);
  print(time[0]);
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey:'Reminder',
      title:
          '${Emojis.smile_face_with_open_mouth} Reminder',
      body:
          'Don\'t forget to take your drug${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    // schedule: NotificationCalendar(
    //   weekday: d,
    //   hour: int.parse(time[0]),
    //   minute: int.parse(time[1]),
    //   second: 0,
    //   millisecond: 0,
    //   repeats: true,
    // ),
  );
}
