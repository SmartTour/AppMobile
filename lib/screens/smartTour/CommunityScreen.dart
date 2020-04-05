import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/layout/SmartTourLayout.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SmartTourLayout(
        titleAppBar: 'Ask Page',
        silverAppBar: true,
        child: Container(
          child: Center(
            child: Text('I am an ask page'),
          ),
        ));
  }
}
