import 'package:flutter/material.dart';
import 'package:formulahack/ui/detail_driver/result_driver.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/color_values.dart';
import '../widgets/sliver_delegate.dart';
import 'information_driver.dart';
import 'result_driver.dart';

class DetailDriver extends StatefulWidget {
  final String driverId;
  const DetailDriver({Key? key, required this.driverId}) : super(key: key);

  @override
  State<DetailDriver> createState() => _DetailDriverState();
}

class _DetailDriverState extends State<DetailDriver>
    with TickerProviderStateMixin {
  ScrollController? _scrollController;
  TabController? _tabController;

  final double _height = 150;
  bool _lastStatus = true;

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (_height - kToolbarHeight);
  }

  void _scrollListener() {
    if (_isShrink != _lastStatus) {
      setState(() {
        _lastStatus = _isShrink;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController!.removeListener(_scrollListener);
    _scrollController!.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, isScrolled) {
        return [
          SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            expandedHeight: _height,
            backgroundColor: ColorValues.secondColor,
            title: _isShrink
                ? Text(
                    "Charles Leclerc",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : null,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 23),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Charles",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Leclerc",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 212, 212, 212),
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/drivers/leclerc.png')
                    ],
                  )),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              TabBar(
                controller: _tabController,
                labelColor: ColorValues.primaryColor,
                unselectedLabelColor: Colors.white70,
                labelStyle: GoogleFonts.exo(
                  fontWeight: FontWeight.w600,
                ),
                indicator: const UnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: 2, color: ColorValues.primaryColor),
                ),
                tabs: const [
                  Tab(text: "INFORMATIONS"),
                  Tab(text: "RESULTS"),
                ],
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          InformationDriver(),
          ResultDriver(driverId: widget.driverId)
        ],
      ),
    ));
  }
}
