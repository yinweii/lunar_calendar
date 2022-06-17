import 'package:calender/screens/dashboard/dashboard_screen.dart';
import 'package:calender/utils/lunar_calender_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color

    systemNavigationBarDividerColor:
        Colors.transparent, //Navigation bar divider color
  ));
  var now = DateTime.now();
  int timeZone = int.parse(now.timeZoneName);
  print(int.parse(now.timeZoneName));

  var dateLunar = convertSolar2Lunar(now.day, now.month, now.year, timeZone);
  print('Lunar: $dateLunar');

  var dateSolar =
      convertLunar2Solar(dateLunar[0], dateLunar[1], dateLunar[2], 0, timeZone);
  print('dateSolar: $dateSolar');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashBoardScreen(),
    );
  }
}
