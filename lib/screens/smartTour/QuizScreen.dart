import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/layout/SmartTourLayout.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SmartTourLayout(
        titleAppBar: 'Quiz page',
        silverAppBar: true,
        child: Container(
          child: Center(
            child: Text('I am quiz page'),
          ),
        ));
  }
}
