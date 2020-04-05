class DetectionParametersModel {
  int id;
  int idContent;
  int zone;
  DetectionParametersModel.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        idContent = json['IDContent'],
        zone = json['Zone'];
}
