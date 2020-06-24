import 'package:smart_tour_mobile/models/ContentModel.dart';
class BaseTourZoneModel {
  int id;
  int order;
  ContentModel content;

  BaseTourZoneModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        order = json['order'],
        content = ContentModel.fromJson(json['content']);
}
