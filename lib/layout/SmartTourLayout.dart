import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/components/SilverAppBarView.dart';
import 'package:smart_tour_mobile/components/drawers/SmartTourDrawer.dart';

class SmartTourLayout extends StatelessWidget {
  final String titleAppBar;
  final Widget child;
  final FloatingActionButton floatingActionBotton;
  final bool silverAppBar;
  final Widget bottomNavigationBar;

  SmartTourLayout(
      {@required this.titleAppBar,
      @required this.child,
      this.floatingActionBotton,
      this.silverAppBar = false,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !this.silverAppBar
          ? AppBar(
              title: Text(this.titleAppBar),
              backgroundColor: Colors.black,
            )
          : null,
      drawer: SmartTourDrawer(),
      body: this.silverAppBar
          ? SilverAppBarView(
              title: this.titleAppBar,
              child: this.child,
            )
          : this.child,
      floatingActionButton: this.floatingActionBotton,
      bottomNavigationBar: this.bottomNavigationBar,
    );
  }
}
