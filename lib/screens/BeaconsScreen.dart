import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';
import 'package:smart_tour_mobile/helpers/BeaconHelper.dart';
import 'package:smart_tour_mobile/layout/DefaultLayout.dart';
import 'package:smart_tour_mobile/state/BeaconsState.dart';

class BeaconsScreen extends StatefulWidget {
  @override
  _BeaconsScreenState createState() => _BeaconsScreenState();
}

class _BeaconsScreenState extends State<BeaconsScreen> {
  bool scanStart = false;

  @override
  void initState() {
    print('entrato in Beacons Screen');
    super.initState();
  }

  setScanStart(value) {
    setState(() {
      scanStart = value;
    });
  }

  @override
  void dispose() {
    print('uscito da Beacons Screen');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BeaconsState>(builder: (context, state, child) {
      return DefaultLayout(
          titleAppBar: "Beacons",
          silverAppBar: true,
          child: state.listBeacons == null
              ? Center(
                  child: Text("Inizia la visita guidata"),
                )
              : ListView.builder(
                  itemCount: state.listBeacons.length,
                  itemBuilder: (context, index) {
                    if (state.listBeacons == null) {
                      return Center(child: CircularProgressIndicator());
                    }
                    String nameDevice = state.listBeacons[index].device.name;
                    AdvertisementData data =
                        state.listBeacons[index].advertisementData;
                    int txPowerLevel =
                        state.listBeacons[index].advertisementData.txPowerLevel;
                    int rssi = state.listBeacons[index].rssi;

                    return Card(
                      child: Column(
                        children: <Widget>[
                          Text(
                            nameDevice,
                            style: TextStyle(fontSize: 50),
                          ),
                          Text(
                            data.localName,
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'd: ${(rssi != null && txPowerLevel != null) ? BeaconHelper.getDistance(rssi, txPowerLevel.round()).toString() + 'm' : 'ND'}',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            'rssi: ' + rssi.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'PWlevel: ' + txPowerLevel.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'UUID: ${data.serviceUuids != null ? data.serviceUuids.toString() : 'ND'}',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'ManufacturData: ' +
                                data.manufacturerData.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  },
                ),
          floatingActionBotton: FloatingActionButton(
            child: Icon(this.scanStart ? Icons.stop : Icons.search),
            onPressed: () {
              state.startScan();
            },
          ));
    });
  }
}
