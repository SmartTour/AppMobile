import 'package:flutter/cupertino.dart';
import 'package:smart_tour_mobile/models/BaseTourModel.dart';
import 'package:smart_tour_mobile/services/ApiService.dart';

import 'TourCard.dart';

class TourList extends StatelessWidget {
  final List<BaseTourModel> list;
  final Function exploreFunciton;
  TourList({@required this.list, this.exploreFunciton});

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
                  exploreFunction: (){
                    ApiService.fetchBaseTourZones(this.list[index].id).then((value){
                      Navigator.pushNamed(context, '/smart-tour/base-tour',
                      arguments: value);
                      print(value.toString());
                      });
                       
                  }
                  ));
        });
  }
}
