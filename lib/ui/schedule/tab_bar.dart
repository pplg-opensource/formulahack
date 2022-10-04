import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/ui/schedule/past.dart';
import 'package:formulahack/ui/schedule/upcoming.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  final List<Tab> _tab = [
    const Tab(
      text: "UPCOMING",
    ),
    const Tab(
      text: "PAST",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: _tab.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorValues.backgroundColor,
        elevation: 0,
        title: const Text(
          'Schedule',
          style: TextStyle(
              color: ColorValues.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w800),
        ),
        bottom: TabBar(
          tabs: _tab,
          controller: _controller,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 2, color: ColorValues.primaryColor),
          ),
          labelColor: ColorValues.primaryColor,
          unselectedLabelColor: Colors.white70,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          UpcomingPage(),
          PastPage(),
        ],
      ),
    );
  }
}
