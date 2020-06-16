import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/screens/BaseToursScreen.dart';
import 'package:smart_tour_mobile/screens/LiveToursScreen.dart';
import 'package:smart_tour_mobile/screens/InfoScreen.dart';
import 'package:smart_tour_mobile/screens/SettingsScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<BottomNavigationBarItem> myTabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.info), title: Text("Info")),
    BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      title: Text("LiveTour"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.collections),
      title: Text("BaseTour"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text("settings"),
    ),
  ];
  final List<Widget> panels = <Widget>[
    InfoScreen(),
    LiveToursScreen(),
    BaseToursScreen(),
    SettingsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: panels.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        heroTag: "exploreHero",
        child: Image.asset("assets/logoWhite.png"),
        // Icon(
        //   Icons.camera,
        //   size: 50,
        // ),
        onPressed: () {
          Navigator.pushNamed(context, '/explore');
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 2.5,
        clipBehavior: Clip.antiAlias,
        child: Container(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: myTabs,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}
