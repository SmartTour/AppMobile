import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tour_mobile/components/TourCard.dart';
import 'package:smart_tour_mobile/helpers/SmartTourHelper.dart';
import 'package:smart_tour_mobile/layout/AnimatedLayout.dart';
import 'package:smart_tour_mobile/models/ContentModel.dart';
import 'package:smart_tour_mobile/models/DetectionParametersModel.dart';
import 'package:smart_tour_mobile/state/SmartTourState.dart';

class LiveTourScreen extends StatefulWidget {
  @override
  _LiveTourScreenState createState() => _LiveTourScreenState();
}

class _LiveTourScreenState extends State<LiveTourScreen> {
  ContentModel content;

  @override
  Widget build(BuildContext context) {
    final DetectionParametersModel args =
        ModalRoute.of(context).settings.arguments;

    return AnimatedLayout(
      child: content == null
          ? Center(
              child: Text('Nessun contenuto trovato'),
            )
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 200, horizontal: 20),
              child: Column(
                children: <Widget>[
                  TourCard(
                      title: this.content.title,
                      exploreFunction: () {
                        Navigator.pushNamed(context, '/smart-tour/tour-viewer',
                            arguments: this.content.contentHtml);
                      }),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo_camera),
        onPressed: () {
          if (content == null) {
            setState(() {
              content = SmartTourHelper.findContent(
                  Provider.of<SmartTourState>(context, listen: false), args);
            });
          } else {
            setState(() {
              content = null;
            });
          }
        },
      ),
    );
  }
}
