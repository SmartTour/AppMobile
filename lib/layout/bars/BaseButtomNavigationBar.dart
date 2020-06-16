import 'package:flutter/material.dart';

class BaseButtomNavigationBar extends StatelessWidget {
  final String title;
  final Widget child;
  final Color backgroundColor;
  BaseButtomNavigationBar(
      {@required this.title,
      @required this.child,
      this.backgroundColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: 200,
              backgroundColor: this.backgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(this.title),
              ))
        ];
      },
      body: this.child,
    );
  }
}
