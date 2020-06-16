class BaseTourModel {
  int id;
  String title;
  String urlImage;
  String description;

  BaseTourModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        urlImage = json['imageUrl'],
        description = json['description'];
}
