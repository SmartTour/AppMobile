import 'package:flutter/material.dart';

class TourCard extends StatelessWidget {
  final Function exploreFunction;
  final String title;
  final String description;
  final String urlImage;
  TourCard(
      {@required this.exploreFunction,
      @required this.title,
      this.urlImage = 'tourLive1.jpg',
      this.description});

  @override
  Widget build(BuildContext context) {
    ThemeData localTheme = Theme.of(context);
    return Card(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Image.asset('assets/' + urlImage, fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  title,
                  style: localTheme.textTheme.title,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(description != null ? description : '',
                    style: localTheme.textTheme.body1),
                SizedBox(
                  height: 16.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    child: Text('EXPLORE'),
                    onPressed: this.exploreFunction,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
