import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tour_mobile/layout/AnimatedLayout.dart';
import 'package:smart_tour_mobile/state/SmartTourState.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "exploreHero",
      child: AnimatedLayout(
          child: Center(
              child: IconButton(
                  hoverColor: Colors.black38,
                  onPressed: () async {
                    await Provider.of<SmartTourState>(context, listen: false)
                        .loadSmartTour();
                    Navigator.pushNamed(context, '/');
                  },
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 50,
                  )))),
    );
  }
}
