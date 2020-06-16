import 'package:flutter/material.dart';

class BaseDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'AGENCY',
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Info'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.explore),
            title: Text('Tours'),
            onTap: () {
              Navigator.pushNamed(context, '/tours');
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
