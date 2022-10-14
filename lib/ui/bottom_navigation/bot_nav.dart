import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formulahack/ui/driver_standing/driver_list.dart';
import 'package:formulahack/ui/history_page/tab_bar.dart';
import 'package:formulahack/ui/home_page/home_page.dart';
import 'package:formulahack/ui/team_page/team_page.dart';
import 'package:formulahack/ui/schedule/tab_bar.dart';

class BottomNavbar extends StatefulWidget {
  BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentindex = 0;
  final Screens = [
    HomePage(),
    TabBarPage(),
    DriverStanding(),
    TeamPage(),
    HistoryTabBarPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF2A2A2A),
          selectedItemColor: Color(0xFFFE1700),
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentindex,
          onTap: (index) => setState(
                () => currentindex = index,
              ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: "Schedule",
            ),
            BottomNavigationBarItem(
                icon: Transform.rotate(
                  angle: 180 * pi / 90,
                  child: Icon(Icons.sports_motorsports_outlined),
                ),
                label: "drivers"),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.car,
                size: 18,
              ),
              label: "Team",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.flagCheckered,
                size: 18,
              ),
              label: "History",
            ),
          ]),
    );
  }
}
