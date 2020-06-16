import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/helpers/JsonHelper.dart';
import 'package:smart_tour_mobile/models/BaseTourModel.dart';
import 'package:smart_tour_mobile/models/LiveTourModel.dart';

class SmartTourState extends ChangeNotifier {
  List<BaseTourModel> listBaseTour = [];
  List<LiveTourModel> listLiveTour = [];

  Future<void> loadSmartTour() async {
    Map data = await JsonHelper.loadJson('smart-tour-data.json');
    loadListBaseTour(JsonHelper.listBaseTourFromJson(data['BaseTours']));
    loadListLiveTour(JsonHelper.listLiveTourFromJson(data['LiveTours']));
  }

  void loadListBaseTour(value) {
    listBaseTour = value;
    notifyListeners();
  }

  void loadListLiveTour(value) {
    listLiveTour = value;
    notifyListeners();
  }
}
