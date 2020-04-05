import 'package:smart_tour_mobile/helpers/JsonHelper.dart';
import 'package:smart_tour_mobile/models/BaseTourModel.dart';
import 'package:smart_tour_mobile/models/DetectionParametersModel.dart';

class LiveTourModel extends BaseTourModel {
  List<DetectionParametersModel> detectionParameters;

  LiveTourModel.fromJson(Map<String, dynamic> json)
      : detectionParameters = JsonHelper.listDetectionParametersFromJson(
            json['DetectionParameters']),
        super.fromJson(json);
}
