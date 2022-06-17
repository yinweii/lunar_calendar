import 'package:calender/screens/dashboard/components/item_data.dart';
import 'package:calender/screens/dashboard/components/tabitem.dart';
import 'package:calender/screens/day_calendar/day_screen.dart';
import 'package:calender/screens/month_calendar/month_screen.dart';
import 'package:calender/screens/others/other_screen.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  final _page = const [
    DayScreen(),
    MonthScreen(),
    OtherScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            IndexedStack(
              index: _selectedIndex,
              children: [
                ..._page,
              ],
            ),
            BottomTab(
              items: [
                ItemData(
                  index: 0,
                  title: "Ngày",
                  icon: Icons.today,
                ),
                ItemData(
                  index: 1,
                  title: "Tháng",
                  icon: Icons.date_range,
                ),
                ItemData(
                  index: 2,
                  title: "Cài đặt",
                  icon: Icons.settings,
                ),
              ],
              currentIndex: _selectedIndex,
              onTabTapped: _onItemTapped,
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.today),
      //       label: 'Ngày',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.date_range),
      //       label: 'Tháng',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Cài đặt',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}

class BottomTab extends StatelessWidget {
  const BottomTab(
      {Key? key,
      required this.items,
      required this.currentIndex,
      required this.onTabTapped})
      : super(key: key);
  final List<ItemData> items;
  final int currentIndex;
  final Function onTabTapped;
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var item in items) {
      var tabItem = TabItem(
        title: item.title,
        icon: item.icon,
        isSelected: item.index == currentIndex,
        onPress: () {
          onTabTapped(item.index);
        },
      );
      children.add(tabItem);
    }
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      height: 60,
      child: Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.35)),
        child: Row(children: children),
      ),
    );
  }
}
