import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tour_mobile/components/TourList.dart';
import 'package:smart_tour_mobile/layout/SmartTourLayout.dart';
import 'package:smart_tour_mobile/state/SmartTourState.dart';

class ToursScreen extends StatefulWidget {
  const ToursScreen({Key key}) : super(key: key);
  @override
  _ToursScreenState createState() => _ToursScreenState();
}

class _ToursScreenState extends State<ToursScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.account_balance)),
    Tab(icon: Icon(Icons.art_track))
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SmartTourState>(builder: (context, state, child) {
      return SmartTourLayout(
          titleAppBar: 'Tours',
          silverAppBar: true,
          bottomNavigationBar: TabBar(
            tabs: myTabs,
            controller: _tabController,
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
          ),
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Container(
                  child: TourList(
                list: state.listLiveTour,
                exploreFunciton: () {
                  Navigator.pushNamed(context, '/smart-tour/live-tour',
                      arguments: state.listLiveTour[0].detectionParameters[0]);
                },
              )),
              Container(
                  child: TourList(
                list: state.listBaseTour,
                exploreFunciton: () {
                  Navigator.pushNamed(context, '/smart-tour/base-tour',
                      arguments: state.listBaseTour[0].contents);
                },
              )),
            ],
          ));
    });
  }
}
