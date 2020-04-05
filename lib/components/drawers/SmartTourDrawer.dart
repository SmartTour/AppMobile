import 'package:flutter/material.dart';

class SmartTourDrawer extends StatelessWidget {
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
              Navigator.pushNamed(context, '/smart-tour/info');
            },
          ),
          ListTile(
            leading: Icon(Icons.explore),
            title: Text('Tours'),
            onTap: () {
              Navigator.pushNamed(context, '/smart-tour/tours');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Quiz'),
            onTap: () {
              Navigator.pushNamed(context, '/smart-tour/tours');
            },
          ),
          ListTile(
            leading: Icon(Icons.chrome_reader_mode),
            title: Text('Ask & fac'),
            onTap: () {
              Navigator.pushNamed(context, '/smart-tour/community');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_backup_restore),
            title: Text('Go Back'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
