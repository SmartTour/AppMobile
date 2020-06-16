import 'package:flutter/material.dart';

class SilverAppBarView extends StatelessWidget {
  final String title;
  final Widget child;
  final Color backgroundColor;
  SilverAppBarView(
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
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(this.title),
              // background: Image.asset(
              //   "assets/images/backgroundBar.png",
              //   fit: BoxFit.cover,
              // ),
            ),
          )
        ];
      },
      body: this.child,
    );
  }
}
