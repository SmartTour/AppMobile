import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/components/TourList.dart';
import 'package:smart_tour_mobile/layout/DefaultLayout.dart';
import 'package:smart_tour_mobile/models/LiveTourModel.dart';
import 'package:smart_tour_mobile/services/ApiService.dart';

class LiveToursScreen extends StatefulWidget {
  @override
  _LiveToursScreenState createState() => _LiveToursScreenState();
}

class _LiveToursScreenState extends State<LiveToursScreen> {
  List<LiveTourModel> liveTours;
  // @override
  // void initState() {
  //   super.initState();
  //   updateStateLiveTours();
  // }

  // Future<void> updateStateLiveTours() {
  //   return ApiService.fetchLiveTours()
  //       .then((value) => {setState(() => liveTours = value)});
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return DefaultLayout(
  //     titleAppBar: "Live Tours",
  //     silverAppBar: true,
  //     child: Center(
  //       child: RefreshIndicator(
  //           child: liveTours != null
  //               ? TourList(
  //                   list: liveTours,
  //                   exploreFunciton: () {},
  //                 )
  //               : CircularProgressIndicator(),
  //           onRefresh: () => updateStateLiveTours()),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        titleAppBar: "Live Tours",
        silverAppBar: true,
        child: Center(
          child: Text('this is the Live page'),
        ));
  }
}
