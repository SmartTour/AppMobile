import 'package:smart_tour_mobile/models/ContentModel.dart';
import 'package:smart_tour_mobile/models/DetectionParametersModel.dart';
import 'package:smart_tour_mobile/state/SmartTourState.dart';

class SmartTourHelper {
  static ContentModel findContent(
      SmartTourState state, DetectionParametersModel detectionParameters) {
    ContentModel content;

    state.listLiveTour.forEach((tour) {
      tour.contents.forEach((test) {
        content = test;
        if (content.id == detectionParameters.idContent) return;
      });
    });
    return content;
  }
}
