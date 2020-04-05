import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tour_mobile/layout/DefaulLayout.dart';
import 'package:smart_tour_mobile/state/SettingsState.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool loadingUpdateLocation = false;

  setLoadingUpdateLocation(bool value) {
    setState(() {
      loadingUpdateLocation = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsState>(builder: (context, state, child) {
      return DefaultLayout(
          titleAppBar: 'Settings',
          child: Container(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Location'),
                  subtitle: Text(state.locationPermission.toString() +
                      ' e ${state.locationIsEnable ? 'attivo' : 'non attivo'}'),
                  onTap: () async {
                    setLoadingUpdateLocation(true);
                    await state.updateLocationService();
                    setLoadingUpdateLocation(false);
                  },
                ),
                ListTile(
                  title: Text('Bluetooth'),
                  subtitle:
                      Text(state.bluetoothIsEnable ? 'attivo' : 'non attivo'),
                  onTap: () {},
                ),
                SwitchListTile(
                    title: Text('DarkMode'),
                    value: state.darkMode,
                    onChanged: (value) => state.changeDarkMode(value))
              ],
            ),
          ));
    });
  }
}
