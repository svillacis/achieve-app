import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

// int getCurrentDate() {
//   var now = new DateTime.now();
//   return ((now.day + (now.month - 1) * 31) % 318);
// }
//
// void showNotification() {
//   LocalNotifyManager localNotifyManager = LocalNotifyManager.init();
//   localNotifyManager.showNotification(dailyQuotes[getCurrentDate()].phrase,
//       "Daily Quote by ${dailyQuotes[getCurrentDate()].author}");
// }

// void callback() async {
//   await AndroidAlarmManager.oneShotAt(DateTime.now(), 5, showNotification);
// }

// void callback() async {
//   await AndroidAlarmManager.periodic(
//     const Duration(hours: 24), //Do the same every 24 hours
//     0, //Different ID for each alarm
//     showNotification,
//     wakeup: false, //the device will be woken up when the alarm fires
//     startAt: DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day,
//       10,
//       30,
//       //hourTime,
//       //minuteTime
//     ), //Start whit the specific time 5:00 am
//     rescheduleOnReboot: true, //Work after reboot
//   );
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
