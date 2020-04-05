import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tour_mobile/screens/HomeScreen.dart';
import 'package:smart_tour_mobile/screens/SettingsScreen.dart';
import 'package:smart_tour_mobile/screens/ExploreScreen.dart';
import 'package:smart_tour_mobile/screens/BeaconsScreen.dart';
import 'package:smart_tour_mobile/state/BeaconsState.dart';
import 'package:smart_tour_mobile/state/SettingsState.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => SettingsState()),
      ChangeNotifierProvider(create: (context) => BeaconsState())
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Tour Mobile',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/settings': (context) => SettingsScreen(),
        '/explore': (context) => ExploreScreen(),
        '/beacons': (context) => BeaconsScreen()
      },
    );
  }
}
