import 'package:smart_tour_mobile/helpers/JsonHelper.dart';
import 'package:smart_tour_mobile/models/ContentModel.dart';

class BaseTourModel {
  int id;
  String title;
  String urlImage;
  String description;
  List<ContentModel> contents;

  BaseTourModel.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        title = json['Title'],
        urlImage = json['UrlImage'],
        description = json['Description'],
        contents = JsonHelper.listContentFromJson(json['Contents']);
}
