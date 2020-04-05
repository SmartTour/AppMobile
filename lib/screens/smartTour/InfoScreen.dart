import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/layout/SmartTourLayout.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SmartTourLayout(
        titleAppBar: "Info Agency",
        silverAppBar: true,
        child: Center(
          child: Text('this is the info page'),
        ));
  }
}
