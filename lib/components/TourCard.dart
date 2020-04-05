import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/models/BaseTourModel.dart';

class TourCard extends StatelessWidget {
  final BaseTourModel tour;
  TourCard({@required this.tour});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/' + tour.urlImage,
            width: 200,
            height: 400,
          ),
          ListTile(title: Text(tour.title)),
          // Text(tour.description),
          FlatButton(
            child: Text('EXPLORE'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
