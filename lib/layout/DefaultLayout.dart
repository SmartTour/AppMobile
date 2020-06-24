import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/layout/bars/SilverAppBarView.dart';
import 'package:smart_tour_mobile/layout/drawers/BaseDrawer.dart';

class DefaultLayout extends StatelessWidget {
  final String titleAppBar;
  final Widget child;
  final FloatingActionButton floatingActionBotton;
  final bool silverAppBar;
  final Widget bottomNavigationBar;

  DefaultLayout(
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
            centerTitle: true,
              title: Text(this.titleAppBar),
            )
          : null,
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
