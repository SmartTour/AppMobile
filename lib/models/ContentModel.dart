class ContentModel {
  int id;
  String htmlContent;

  ContentModel.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        htmlContent = json['HtmlContent'];
}
