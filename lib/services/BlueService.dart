import 'package:flutter_blue/flutter_blue.dart';

class BlueService {
  static FlutterBlue flutterBlue = FlutterBlue.instance;

  static Stream<List<ScanResult>> scanDevices() {
    flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
    return flutterBlue.scanResults;
  }

  static Future<void> stopScan() async {
    //non funzia
    if (isScanning()) await flutterBlue.stopScan();

    print('Stop scan: ' + stopScan.toString());
  }

  static bool isScanning() {
    bool isScanning = false;
    flutterBlue.isScanning.listen((onData) {
      isScanning = onData != null ? onData : false;
    });
    return isScanning;
  }

  static Future<bool> isEnable() async {
    if (await flutterBlue.isAvailable) {
      if (await flutterBlue.isOn) {
        return true;
      }
    }
    return false;
  }
}
