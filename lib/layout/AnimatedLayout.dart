import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/components/animated/AnimatedBackground.dart';
import 'package:smart_tour_mobile/components/animated/AnimatedWave.dart';

class AnimatedLayout extends StatelessWidget {
  final Widget child;
  final FloatingActionButton floatingActionButton;

  AnimatedLayout({@required this.child, this.floatingActionButton});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned.fill(child: AnimatedBackground()),
            onBottom(AnimatedWave(
              height: 180,
              speed: 1.0,
            )),
            onBottom(AnimatedWave(
              height: 120,
              speed: 0.9,
              offset: pi,
            )),
            onBottom(AnimatedWave(
              height: 220,
              speed: 1.2,
              offset: pi / 2,
            )),
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
            Positioned.fill(child: this.child),
          ],
        ),
        floatingActionButton: this.floatingActionButton,
      ),
    );
  }

  onBottom(Widget child) => Positioned.fill(
          child: Align(
        alignment: Alignment.bottomCenter,
        child: child,
      ));
}
