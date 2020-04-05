import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/components/drawers/BaseDrawer.dart';

class DefaultLayout extends StatelessWidget {
  final String titleAppBar;
  final Widget child;
  final Widget floatingActionBotton;

  DefaultLayout(
      {@required this.titleAppBar,
      @required this.child,
      this.floatingActionBotton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.titleAppBar),
      ),
      drawer: BaseDrawer(),
      body: this.child,
      floatingActionButton: this.floatingActionBotton,
    );
  }
}
