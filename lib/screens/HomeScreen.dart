import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/layout/DefaulLayout.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        titleAppBar: 'Home',
        child: Container(
          child: Center(
            child: Text("this is the Home Page"),
          ),
        ));
  }
}
