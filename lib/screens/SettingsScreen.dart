import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tour_mobile/components/EditValue.dart';
import 'package:smart_tour_mobile/helpers/JsonHelper.dart';
import 'package:smart_tour_mobile/layout/DefaultLayout.dart';
import 'package:smart_tour_mobile/state/SettingsState.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool loadingUpdateLocation = false;

  @override
  void initState() {
    super.initState();
    // Provider.of<SettingsState>(context).changeAgencyId()
    JsonHelper.dataConfig().then((value) {
      Provider.of<SettingsState>(context, listen: false)
          .changeAgencyId(value['agencyId']);
      Provider.of<SettingsState>(context, listen: false)
          .changeUrlWebApi(value['urlWebApi']);
    });
  }

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
                  title: Text('Agency ID'),
                  subtitle: Text(state.agencyID.toString()),
                  onTap: () {
                    // showDialog(
                    //     context: context,
                    //     child: Dialog(
                    //         child: Container(
                    //       padding: EdgeInsets.all(26.0),
                    //       height: 300,
                    //       child: EditValue(
                    //         oldValue: state.agencyID.toString(),
                    //         label: "Inserire AgencyId",
                    //         onChange: (value) {
                    //           int id = value as int;
                    //           print(id);
                    //         },
                    //       ),
                    //     )));
                  },
                ),
                // ListTile(
                //   title: Text('Endpoint Web Api'),
                //   subtitle: Text(state.urlWebApi),
                //   onTap: () {
                //     // showDialog(
                //     //     context: context,
                //     //     child: Dialog(
                //     //         child: Container(
                //     //       padding: EdgeInsets.all(26.0),
                //     //       height: 300,
                //     //       child: EditValue(
                //     //         oldValue: state.urlWebApi,
                //     //         label: "Inserire url web Api",
                //     //         onChange: (value) {
                //     //           print(value);
                //     //         },
                //     //       ),
                //     //     )));
                //   },
                // ),
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
                    onChanged: (value) => state.changeDarkMode(value)),
                ListTile(
                  title: Text('Info'),
                  onTap: () {
                    showAboutDialog(
                        context: context,
                        applicationIcon: Icon(Icons.explore),
                        applicationVersion: "1.0",
                        applicationLegalese:
                            'Smart Tour è un servizio semplice e intuitivo che permetta ai nostri clienti di realizzare visite guidate interattive all’interno dei loro edifici. In questo modo gli acquirenti potranno presentare al pubblico al meglio la loro realtà, focalizzandosi sulla propria storia e su ciò che realmente li distingue, trasmettendo sicurezza e qualità.');
                  },
                ),
              ],
            ),
          ));
    });
  }
}
