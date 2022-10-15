import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/model/constructor_driver_result_model.dart';
import 'package:formulahack/service/api_service.dart';
import 'package:formulahack/ui/team_detail/loading_team_detail_tabbar.dart';
import 'package:formulahack/ui/team_detail/tab_informations.dart';
import 'package:formulahack/ui/team_detail/tab_results.dart';
import 'package:formulahack/ui/widgets/sliver_delegate.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamDetailTabbar extends StatefulWidget {
  TeamDetailTabbar(
      {super.key,
      required this.constructorId,
      required this.constructorName,
      required this.allDriver});
  String constructorId, constructorName, allDriver;

  @override
  State<TeamDetailTabbar> createState() => TeamDetailTabbarState();
}

class TeamDetailTabbarState extends State<TeamDetailTabbar>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  TabController? _tabController;
  ConstructorDriverResultModel? _constructorDriverResultModel;
  final double _height = 150;
  bool _lastStatus = true;
  bool isLoading = false;

  Future getApi() async {
    // Team Standing
    _constructorDriverResultModel =
        await ApiService().getTeamDriverResult(widget.constructorId);
    setState(() {
      isLoading = true;
    });
  }

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
    getApi();
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
    var result = _constructorDriverResultModel?.mRData?.raceTable;

    return Scaffold(
      body: isLoading
          ? NestedScrollView(
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
                            widget.constructorName,
                            style: const TextStyle(
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
                              widget.constructorName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              widget.allDriver,
                              style: const TextStyle(
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
                          borderSide: BorderSide(
                              width: 2, color: ColorValues.primaryColor),
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
                  TabInformations(
                    constructorId: widget.constructorId,
                  ),
                  TabResults(result: result!),
                ],
              ),
            )
          : const LoadingTeamDetailTabbar(),
    );
  }
}
