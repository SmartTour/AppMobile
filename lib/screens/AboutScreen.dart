import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/layout/DefaulLayout.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        titleAppBar: 'About',
        child: Container(
          child: Center(
            child: Text("this is the About Page"),
          ),
        ));
  }
}
