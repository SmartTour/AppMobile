import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:smart_tour_mobile/services/BlueService.dart';
import 'package:smart_tour_mobile/services/LocationService.dart';

class BeaconsState extends ChangeNotifier {
  final String text = "ciaooo";
  List<ScanResult> listBeacons;

  Future<bool> startScan() async {
    if (!BlueService.isScanning()) {
      if (await LocationService.serviceAvailable()) {
        if (await BlueService.isEnable()) {
          BlueService.scanDevices().listen((onData) {
            listBeacons = onData;
            notifyListeners();
          });

          return true;
        }
      }
    } else {
      listBeacons = null;
    }
    notifyListeners();
    return false;
  }

  Future<bool> stopScan() async {
    await BlueService.stopScan();
    listBeacons = null;
    notifyListeners();
    return true;
  }
}
