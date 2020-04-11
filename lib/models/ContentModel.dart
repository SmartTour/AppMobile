class ContentModel {
  int id;
  String title;
  String htmlContent;

  ContentModel.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        title = json['Title'],
        htmlContent = json['HtmlContent'];
}
