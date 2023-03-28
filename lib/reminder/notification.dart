  import 'package:awesome_notifications/awesome_notifications.dart';
class notify {
  static Future<bool> create_notification(String t, int d,int idd,String s) async  {
     List time = t.split(":");
    final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
    return awesomeNotifications.createNotification(
      content: NotificationContent(
        id:idd,
        title: "med_aid ",
        body: "don't forget to take your drugs",
        channelKey: s,
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
      
      ),
        //  schedule: NotificationCalendar(
        //       allowWhileIdle: true,
        //       repeats: true,
        //       millisecond: 0,
        //       second:10,
        //       hour: 13,
        //       minute: 26)

    
     schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
    );
  }

}

