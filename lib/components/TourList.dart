import 'package:flutter/cupertino.dart';
import 'package:smart_tour_mobile/models/BaseTourModel.dart';

import 'TourCard.dart';

class TourList extends StatelessWidget {
  final List<BaseTourModel> list;
  final Function exploreFunciton;
  TourList({@required this.list, @required this.exploreFunciton});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: list.length,
        itemBuilder: (contex, index) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: TourCard(
                  title: this.list[index].title,
                  description: this.list[index].description,
                  urlImage: this.list[index].urlImage,
                  exploreFunction: this.exploreFunciton));
        });
  }
}
