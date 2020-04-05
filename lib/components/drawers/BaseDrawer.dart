import 'package:flutter/material.dart';

class BaseDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('SMART TOUR MOBILE'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.explore),
            title: Text('Explore'),
            onTap: () {
              Navigator.pushNamed(context, '/explore');
            },
          ),
          ListTile(
            leading: Icon(Icons.smartphone),
            title: Text('Sample'),
            onTap: () {
              Navigator.pushNamed(context, '/sample');
            },
          ),
          ListTile(
            leading: Icon(Icons.bluetooth_connected),
            title: Text('Beacons'),
            onTap: () {
              Navigator.pushNamed(context, '/beacons');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
