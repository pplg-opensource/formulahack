import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/model/specific_race_model.dart';
import 'package:formulahack/service/api_service.dart';
import 'package:formulahack/ui/detail_race/information.dart';
import 'package:formulahack/ui/detail_race/result.dart';
import 'package:formulahack/ui/widgets/sliver_delegate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailRacePage extends StatefulWidget {
  final String round;

  const DetailRacePage({Key? key, required this.round}) : super(key: key);

  @override
  State<DetailRacePage> createState() => _DetailRacePageState();
}

class _DetailRacePageState extends State<DetailRacePage>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  TabController? _tabController;

  SpecificRaceModel? _specificRaceModel;

  final double _height = 150;
  bool _lastStatus = true;
  bool _isLoad = false;

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

  final List<Tab> _tab = [
    const Tab(
      text: "INFORMATIONS",
    ),
    const Tab(
      text: "RESULTS",
    ),
  ];

  Future getApi() async {
    _specificRaceModel = await ApiService().getSpecificRace(widget.round);
    setState(() {
      _isLoad = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.round);
    getApi();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _tabController = TabController(length: _tab.length, vsync: this);
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
    final size = MediaQuery.of(context).size;

    var specific = _specificRaceModel?.mRData?.raceTable?.races![0];

    return Scaffold(
      body: SafeArea(
        child: _isLoad
            ? NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (context, isScrolled) {
                  return [
                    SliverAppBar(
                      floating: false,
                      pinned: true,
                      snap: false,
                      expandedHeight: 150,
                      backgroundColor: ColorValues.secondColor,
                      title: _isShrink
                          ? Text(
                              specific!.raceName!,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : null,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          width: size.width,
                          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.round,
                                    style: TextStyle(
                                      color: ColorValues.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    specific!.raceName!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    specific.circuit!.circuitName!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    DateFormat('dd MMM yyyy')
                                        .format(DateTime.parse(specific.date!)),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              ClipOval(
                                child: Image.asset(
                                  'assets/countries/${specific.circuit!.location!.country!.toLowerCase()}.png',
                                  width: 45,
                                ),
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
                          tabs: _tab,
                          controller: _tabController,
                          labelStyle: GoogleFonts.exo(
                            fontWeight: FontWeight.w600,
                          ),
                          indicator: const UnderlineTabIndicator(
                            borderSide: BorderSide(
                                width: 2, color: ColorValues.primaryColor),
                          ),
                          labelColor: ColorValues.primaryColor,
                          unselectedLabelColor: Colors.white70,
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    InformationRacePage(
                      round: widget.round,
                    ),
                    ResultPage(
                      round: widget.round,
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
