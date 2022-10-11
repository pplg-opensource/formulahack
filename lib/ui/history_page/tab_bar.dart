import 'package:flutter/material.dart';
import 'package:formulahack/ui/history_page/driver.dart';
import 'package:formulahack/ui/history_page/schedule.dart';
import 'package:formulahack/ui/history_page/teams.dart';

import '../../common/color_values.dart';

class HistoryTabBarPage extends StatefulWidget {
  const HistoryTabBarPage({Key? key}) : super(key: key);

  @override
  State<HistoryTabBarPage> createState() => _HistoryTabBarPageState();
}

class _HistoryTabBarPageState extends State<HistoryTabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  final List<Tab> _tab = [
    const Tab(
      text: "DRIVERS",
    ),
    const Tab(
      text: "TEAMS",
    ),
    const Tab(
      text: "SCHEDULE",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorValues.backgroundColor,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'History',
              style: TextStyle(
                  color: ColorValues.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w800),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children:  [
                  const Text('Seasons ', style: TextStyle(fontSize: 15)),
                  InkWell(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => const AlertDialog(
                        title: Text(
                          'Seasons',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        content: Text(
                          '2022',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white
                          ),
                        ),
                        actions: <Widget>[
                          SizedBox(
                            width: 100,
                            height: 200,
                          )
                        ],
                      ),
                    ),
                    child: const Text(
                      '2021',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            )
          ],
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
            DriverPage(),
            TeamsPage(),
            SchedulePage()
          ],
        ),
      ),
    );
  }
}
