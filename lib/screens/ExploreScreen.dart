import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tour_mobile/components/animated/AnimatedBackground.dart';
import 'package:smart_tour_mobile/components/animated/AnimatedWave.dart';
import 'package:smart_tour_mobile/layout/DefaulLayout.dart';
import 'package:smart_tour_mobile/state/SmartTourState.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        titleAppBar: 'Explore',
        child: Stack(
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
            Positioned.fill(
                child: Center(
              child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () async {
                    await Provider.of<SmartTourState>(context, listen: false)
                        .loadSmartTour();
                    Navigator.pushNamed(context, '/smart-tour/info');
                  }),
            )),
          ],
        ));
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}
