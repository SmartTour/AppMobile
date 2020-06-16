import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tour_mobile/screens/ExploreScreen.dart';
import 'package:smart_tour_mobile/screens/MainScreen.dart';
import 'package:smart_tour_mobile/screens/SettingsScreen.dart';
import 'package:smart_tour_mobile/screens/BeaconsScreen.dart';
import 'package:smart_tour_mobile/screens/InfoScreen.dart';
import 'package:smart_tour_mobile/screens/ToursScreen.dart';

import 'package:smart_tour_mobile/screens/screensWidget/BaseTourScreen.dart';
import 'package:smart_tour_mobile/screens/screensWidget/LiveTourScreen.dart';
import 'package:smart_tour_mobile/screens/screensWidget/TourViewerScreen.dart';

import 'package:smart_tour_mobile/state/BeaconsState.dart';
import 'package:smart_tour_mobile/state/SettingsState.dart';
import 'package:smart_tour_mobile/state/SmartTourState.dart';
import 'package:smart_tour_mobile/theme/BaseTheme.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => SettingsState()),
      ChangeNotifierProvider(create: (context) => BeaconsState()),
      ChangeNotifierProvider(create: (context) => SmartTourState())
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Tour Mobile',
      theme: BaseTheme.data(),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/info': (context) => InfoScreen(),
        '/explore': (context) => ExploreScreen(),
        '/settings': (context) => SettingsScreen(),
        '/beacons': (context) => BeaconsScreen(),
        '/tours': (context) => ToursScreen(),
        '/smart-tour/live-tour': (context) => LiveTourScreen(),
        '/smart-tour/base-tour': (context) => BaseTourScreen(),
        '/smart-tour/tour-viewer': (context) => TourViewerScreen(),
      },
    );
  }
}
