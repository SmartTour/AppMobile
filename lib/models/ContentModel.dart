class ContentModel {
  int id;
  String title;
  String contentHtml;

  ContentModel.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        title = json['Title'],
        contentHtml = json['contentHtml'];
}
