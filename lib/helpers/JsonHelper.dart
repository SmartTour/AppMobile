import 'dart:convert';

import 'package:smart_tour_mobile/models/BaseTourModel.dart';
import 'package:smart_tour_mobile/models/ContentModel.dart';
import 'package:smart_tour_mobile/models/DetectionParametersModel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:smart_tour_mobile/models/LiveTourModel.dart';

class JsonHelper {
  static List<ContentModel> listContentFromJson(List<dynamic> json) {
    List<ContentModel> list = [];
    json.forEach((value) {
      list.add(ContentModel.fromJson(value));
    });
    return list;
  }

  static List<DetectionParametersModel> listDetectionParametersFromJson(
      List<dynamic> json) {
    List<DetectionParametersModel> list = [];
    json.forEach((value) {
      list.add(DetectionParametersModel.fromJson(value));
    });
    return list;
  }

  static List<BaseTourModel> listBaseTourFromJson(List<dynamic> json) {
    List<BaseTourModel> list = [];
    json.forEach((value) {
      list.add(BaseTourModel.fromJson(value));
    });
    return list;
  }

  static List<LiveTourModel> listLiveTourFromJson(List<dynamic> json) {
    List<LiveTourModel> list = [];
    json.forEach((value) {
      list.add(LiveTourModel.fromJson(value));
    });
    return list;
  }

  static Future<Map> loadJson(String srcAsset) async {
    String jsonString = await rootBundle.loadString('assets/' + srcAsset);
    Map jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }
}
