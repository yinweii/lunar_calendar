import 'package:calender/utils/lunar_calender_utils.dart';
import 'package:calender/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

class DayScreen extends StatefulWidget {
  const DayScreen({Key? key}) : super(key: key);

  @override
  State<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    var dateLunar = convertSolar2Lunar(now.day, now.month, now.year, 7);
    print('BUILD');
    return Scaffold(
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/day.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'Hôm nay',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '${now.day}',
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                  Text(
                    Utils.getNameDayOfWeek(now),
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.bottomCenter,
                height: sizeScreen.height / 6,
                color: Colors.black38.withOpacity(0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimerBuilder.periodic(const Duration(seconds: 1),
                        builder: (context) {
                      return buildRow(
                        title: 'Giờ',
                        number: Utils.getSystemTime(),
                        subTitle: 'Meo Meo',
                        fontSize: 25,
                      );
                    }),
                    buildRow(
                        title: 'Âm Lịch',
                        number: '${dateLunar[0]}',
                        subTitle: 'Meo Meo'),
                    buildRow(title: 'Tháng', number: '05', subTitle: 'Meo Meo'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow({
    String? title,
    String? number,
    String? subTitle,
    double? fontSize,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title ?? ''),
          Text(
            number ?? '',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(subTitle ?? ''),
        ],
      ),
    );
  }
}
