import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/components/TourList.dart';
import 'package:smart_tour_mobile/layout/DefaultLayout.dart';
import 'package:smart_tour_mobile/models/BaseTourModel.dart';
import 'package:smart_tour_mobile/services/ApiService.dart';

class BaseToursScreen extends StatefulWidget {
  @override
  _BaseToursScreenState createState() => _BaseToursScreenState();
}

class _BaseToursScreenState extends State<BaseToursScreen> {
  List<BaseTourModel> baseTours;
  @override
  void initState() {
    super.initState();
    updateStateBaseTours();
  }

  Future<void> updateStateBaseTours() {
    return ApiService.fetchBaseTours()
        .then((value) => {setState(() => baseTours = value)});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      titleAppBar: "Base Tours",
      silverAppBar: true,
      child: Center(
        child: RefreshIndicator(
            child: baseTours != null
                ? TourList(
                    list: baseTours,
                    exploreFunciton: () {},
                  )
                : CircularProgressIndicator(),
            onRefresh: () => updateStateBaseTours()),
      ),
    );
  }
}
