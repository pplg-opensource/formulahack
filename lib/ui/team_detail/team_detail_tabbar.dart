import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/ui/team_detail/tab_informations.dart';
import 'package:formulahack/ui/team_detail/tab_results.dart';
import 'package:formulahack/ui/widgets/sliver_delegate.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamDetailTabbar extends StatefulWidget {
  const TeamDetailTabbar({super.key});

  @override
  State<TeamDetailTabbar> createState() => TeamDetailTabbarState();
}

class TeamDetailTabbarState extends State<TeamDetailTabbar>
    with SingleTickerProviderStateMixin {
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
                    "Ferrari",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : null,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(23),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ferrari",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "C. Leclerc | C. Sainz",
                      style: TextStyle(
                          color: Color.fromARGB(255, 212, 212, 212),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
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
                tabs: [
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
          TabInformations(),
          TabResults(),
        ],
      ),
    ));
  }
}
